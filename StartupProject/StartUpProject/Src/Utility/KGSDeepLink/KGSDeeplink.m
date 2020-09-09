//
//  KGSDeeplink.m
//  Typography
//
//  Created by KITE GAMES STUDIO on 10/30/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//
//
//  Designed By: Arefin Newaz Prince
//


#import "KGSDeeplink.h"
#import "Social/Social.h"
#import "CommonConstant.h"
#import <MediaShareComponents/MediaShareComponents.h>
#import "KGSTapdaq.h"
#import "DeviceSpecifcationViewController.h"
#import "AppStoryboard.h"
#import "AppInfo.h"
#import "KiteMoreAppsViewController.h"

@interface KGSDeeplink ()
@property (nonatomic, strong) id<ActionComponentProtocol> contactus;
@property (nonatomic, strong) id<ActionComponentProtocol> rateus;
@property (nonatomic, strong) id<ActionComponentProtocol> moreApps;
@end

@implementation KGSDeeplink


+(instancetype) sharedKGSDeeplink {
    
    static KGSDeeplink *kgsDeepling = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        kgsDeepling = [[KGSDeeplink alloc] init];
        
    });
    
    return kgsDeepling;
}

-(instancetype)init {
    
    self = [super init];
    
    if(self) {
        
    }
    
    return self;
}


-(void) requstingPermissionForPushNotification {
    
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        
        UIUserNotificationType types = (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge |UIUserNotificationTypeSound);
        
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
    }
    
    else
    {
        //Deprecated for >iOS_8
        //
        
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
        
    }
    
}

- (void) requestToOpenURL:(NSURL *)url fromWindow:(UIWindow *)window {
    
    [self setRootViewControllerForWindow: window];
    
//    NSMutableDictionary *strQueryStrings = [self getQuaryStringsFromUrl: url];
    
    if ([[url scheme] isEqualToString: URL_SCHEME]) {
        
        if ([[url host] isEqualToString: HOST_MORE_APPS]) {
            
                [self openMoreAppsScreen];
            
        }
        
        if ([[url host] isEqualToString: HOST_RATING]) {
            
            [self openRateUsPage];
            
        }
        
        if ([[url host] isEqualToString:HOST_CONTACT_US]) {
            
                
            [self showContactUs];
            
        }
        
        if ([[url host] isEqualToString: HOST_PUSH_PERMISSION]){
            
            [self requstingPermissionForPushNotification];
            
        }
        
    }

}

-(void) setRootViewControllerForWindow:(UIWindow *)window {
    
//    self.rootViewController = (window.rootViewController.presentedViewController) ? window.rootViewController.presentedViewController: window.rootViewController;
    
    self.rootViewController = [self visibleViewController: [UIApplication sharedApplication].keyWindow.rootViewController];
    
    //SLComposeViewController has some miss behaviour when other viewController presenter on top of this
    //view controller. This kind of trick can be applied. //Towhid.
//    if ([self.rootViewController isKindOfClass:[SLComposeViewController class]]) {
//        UINavigationController *nav = self.rootViewController.navigationController;
//        NSLog(@"SLCompos");
//    }
    
}


- (UIViewController *)visibleViewController:(UIViewController *)rootViewController
{
    
    if (rootViewController.presentedViewController == nil)
    {
        NSLog(@"Window rootViewController");
        return rootViewController;
        
    }
    if ([rootViewController.presentedViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [navigationController visibleViewController];
        
        NSLog(@"Window navigationController");
        return [self visibleViewController:lastViewController];
    }
    if ([rootViewController.presentedViewController isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController.presentedViewController;
        UIViewController *selectedViewController = tabBarController.selectedViewController;
        NSLog(@"Window tabBarController");
        
        return [self visibleViewController:selectedViewController];
    }
    
    NSLog(@"Window presentedViewController");
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    
    return [self visibleViewController:presentedViewController];
}


-(NSMutableDictionary *) getQuaryStringsFromUrl:(NSURL *)url {
    
    NSMutableDictionary *strQueryStrings = [[NSMutableDictionary alloc] init];
    
    for (NSString *strQs in [url.query componentsSeparatedByString:@"&"]) {
        
        // Get the parameter name
        NSString *strKey = [[strQs componentsSeparatedByString:@"="] objectAtIndex:0];
        // Get the parameter value
        NSString *strValue = [[strQs componentsSeparatedByString:@"="] objectAtIndex:1];
        strValue = [strValue stringByReplacingOccurrencesOfString:@"+" withString:@" "];
        strValue = [strValue stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        strQueryStrings[strKey] = strValue;
    }
    
    return strQueryStrings;
}


#pragma mark- Deeplink Methods

-(void)openRateUsPage{
    
    self.rateus = [[RateUs alloc] initWithAppID:ITUNES_APPID];
    
    if ([self.rateus isComponentEnabled]) {
        [self.rateus presentOn:nil onCompletion:nil];
    }
    
}

-(void) openMoreAppsScreen {
    
    //[[KGSTapdaq sharedKGSTapdaq] checkTapdaqRequestForPlace:TAPDAQ_ShowMoreApps];
    MoreApps *more = [[MoreApps alloc] initWithPlacementTag:TAPDAQ_ShowMoreApps fallback:[KiteMoreAppsViewController class]];
    more.artistID = [NSString stringWithFormat:@"lookup?id=%ld", (long)KITEGAMESSTUDIO];
    more.loadAppsWithPathAndCompletionBlock = @selector(loadAppsWithPath:completionBlock:);
    self.moreApps = more;
    if ([self.moreApps isComponentEnabled]) {
        AppStoryboard *board = [AppStoryboard storyboard:nil];
        [self.moreApps presentOn:[board visibleViewController] onCompletion:nil];
    }
}

-(void)showContactUs {
    AppInfo *info = [[AppInfo alloc] init];
    ContactUsContent *content = [ContactUsContent new];
    content.strSubject = [NSString stringWithFormat:CONTACT_SUB,[info stringValueForKey:BundleDisplayName]];
    content.strRecipients = [NSArray arrayWithObject:CONTACT_EMAIL];
    content.strMessageBody = @"<p><br></p><p><br></p><p><br></p>";
    content.dataAttachment = [self getContentAttachmentData];
    
    self.contactus = [[ContactUs alloc] initWithContent:content];
    if ([self.contactus isComponentEnabled]) {
        AppStoryboard *board = [AppStoryboard storyboard:nil];
        [self.contactus presentOn:[board visibleViewController] onCompletion:nil];
    }
    
}

-(NSData *)getContentAttachmentData {
    
    DeviceSpecifcationViewController *controller = [[DeviceSpecifcationViewController alloc] initWithNibName:@"DeviceSpecifcationViewController" bundle:nil];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:controller.view];
    controller.view.hidden = YES;
    UIImage *imgDeviceSpecImage = [controller getDeviceSpecificationImage];
    [controller.view removeFromSuperview];
    
    NSData *data = UIImageJPEGRepresentation(imgDeviceSpecImage,1);
    return data;
}

@end
