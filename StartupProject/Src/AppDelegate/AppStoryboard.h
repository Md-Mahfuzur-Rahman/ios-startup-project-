//
//  AppStoryboard.h
//  StartUpProject
//
//  Created by Towhidul Islam on 12/20/16.
//  Copyright © 2016 Kite Games Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppStoryboard : NSObject

+ (instancetype) newStoryboard:(NSString *)name;

+ (instancetype) storyboard:(NSString*)name;

- (UIViewController*) initialViewController;

- (UIViewController*) viewControllerByType:(Class)type;

- (UIViewController*) viewControllerByStoryboardID:(NSString*)storyboardID;

- (UIViewController*) visibleViewController;

- (void) showViewController:(UIViewController*)viewController sender:(id)sender;

- (void) showModalViewController:(UIViewController*)viewController onCompletion:(void (^)(void))block;

@end
