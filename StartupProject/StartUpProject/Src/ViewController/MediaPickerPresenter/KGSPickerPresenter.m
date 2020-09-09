//
//  KGSPickerPresenter.m
//  Slideshow-Maker
//
//  Created by Towhidul Islam on 11/16/16.
//  Copyright © 2016 KITE GAMES STUDIO. All rights reserved.
//

#import "KGSPickerPresenter.h"
#import "AppDelegate.h"
#import <Photos/Photos.h>
#import "AppInfo.h"

#define PhotoLibPermissionTitle @"Permission Denied!"
#define PhotoLibPermissionMessage @"%@ does not have access to Photo Library. Open Settings and enable access. Thank you."
#define PhotoLibPermissionCancel @"Cancel"
#define PhotoLibPermissionSetting @"Settings"

@interface KGSPickerPresenter () <KGSMediaPickerControllerDelegate>
@property (nonatomic, weak) UIViewController *presenter;
@end

@implementation KGSPickerPresenter

+ (instancetype)sharedInstance{
    static KGSPickerPresenter *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [KGSPickerPresenter new];
    });
    return shared;
}

- (void) presentPickerOn:(UIViewController*)presenter mediaType:(MediaType)type showSetting:(BOOL)shouldShow{
    
    [self presentPickerOn:presenter mediaType:type showPicker:([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized) showSetting:shouldShow];
    
}

- (void) presentPickerOn:(UIViewController*)presenter mediaType:(MediaType)type showPicker:(BOOL)shouldShowPicker showSetting:(BOOL)shouldShowSetting{
    self.presenter = presenter;
    if (shouldShowPicker) {
        [self presentPickerOnMainThread:type];
    }
    else{
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized || shouldShowPicker){
                [self presentPickerOnMainThread:type];
            }
            else if (shouldShowSetting){
                [self showSettingAlert:self.presenter];
            }
        }];
    }
    
}

- (void)presentPickerOn:(UIViewController *)presenter mediaType:(MediaType)type{
    [self presentPickerOn:presenter mediaType:type showSetting:([PHPhotoLibrary authorizationStatus] != PHAuthorizationStatusAuthorized)];
}

- (void) presentPickerOnMainThread:(MediaType)type{
    dispatch_async(dispatch_get_main_queue(),^{
        
        KGSMediaPickerController *mediaPicker = nil;
        if ([self.presenter respondsToSelector:@selector(maxSelectedMedia)]
            && [self.presenter respondsToSelector:@selector(selectedImageSize)]
            && [self.presenter respondsToSelector:@selector(mediaPicker:didFinishPickingMediaWithInfo:)]) {
            mediaPicker = [KGSMediaPickerController mediaPickerController: type delegate: (id<KGSMediaPickerControllerDelegate>)self.presenter];
        }else{
            mediaPicker = [KGSMediaPickerController mediaPickerController: type delegate: (id<KGSMediaPickerControllerDelegate>)self];
        }
        
        [self.presenter presentViewController: mediaPicker animated:YES completion:^{
#warning MediaPickerScreen Tag Localytics
            //[Localytics tagScreen: @"Picker Screen"];
        }];
    });
}

- (BOOL) userAccessAuthorized{
    BOOL authorized = !([PHPhotoLibrary authorizationStatus] != PHAuthorizationStatusAuthorized);
    return authorized;
}

- (void) askForAuthorization:(MediaType)type onCompletion:(void (^)())completion{
    BOOL authorized = !([PHPhotoLibrary authorizationStatus] != PHAuthorizationStatusAuthorized);
    if (authorized == false) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (status == PHAuthorizationStatusAuthorized && completion != nil) {
                    completion();
                }else{
                    [self showSettingAlert:[self visibleViewController]];
                }
            });
        }];
    }
}

- (void) showSettingAlert:(UIViewController*)presenter{
    AppInfo *info = [AppInfo new];
    NSString *message = [NSString stringWithFormat:PhotoLibPermissionMessage, [info stringValueForKey:BundleDisplayName]];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:PhotoLibPermissionTitle
                                                                             message: message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:PhotoLibPermissionCancel
                                                     style:UIAlertActionStyleCancel
                                                   handler:nil];
    [alertController addAction:cancel];
    UIAlertAction *setting = [UIAlertAction actionWithTitle:PhotoLibPermissionSetting
                                                      style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                          NSURL *urlToOpen = [NSURL URLWithString:
                                                                              UIApplicationOpenSettingsURLString];
                                                          if ([[UIApplication sharedApplication] canOpenURL:urlToOpen]) {
                                                              [[UIApplication sharedApplication] openURL:urlToOpen];
                                                          }
                                                      }];
    [alertController addAction:setting];
    dispatch_async(dispatch_get_main_queue(), ^{
        [presenter presentViewController:alertController animated:YES completion:nil];
    });
}

- (UIViewController*) visibleViewController{
    UIViewController *rootViewController = [[(AppDelegate*)[UIApplication sharedApplication].delegate window] rootViewController];
    if (rootViewController != nil) {
        if ([rootViewController isKindOfClass:[UINavigationController class]]) {
            return [(UINavigationController *)rootViewController visibleViewController];
        }else if ([rootViewController isKindOfClass:[UITabBarController class]]){
            return [(UITabBarController*)rootViewController selectedViewController];
        }
    }
    return rootViewController;
}

- (NSInteger)maxSelectedMedia{
    return 1;
}

- (CGSize)selectedImageSize{
    return PHImageManagerMaximumSize;
}

- (void)mediaPicker:(KGSMediaPickerController *)KGSMediaPickerController didFinishPickingMediaWithInfo:(NSArray<Media *> *)arrInfo{
    NSLog(@"!!!! Please Implements KGSMediaPickerControllerDelegate Methods on Presenting ViewController AKA (%@)", NSStringFromClass([self.presenter class]));
    [KGSMediaPickerController dismissViewControllerAnimated:YES completion:nil];
}

@end
