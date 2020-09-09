//
//  KGSDeeplink.h
//  Typography
//
//  Created by KITE GAMES STUDIO on 10/30/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//
//  Designed By: Arefin Newaz Prince
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>


//------------------------------- PUSH NOTIFICATION ----------------------

//kgsl002://moreapps?source=iam

#define URL_SCHEME                      @"kgsl002"
#define HOST_DIRECT_PURCHASE            @"purchase"
#define HOST_PURCHASE_SCREEN            @"store"
#define HOST_RATING                     @"rate"
#define HOST_CONTACT_US                 @"contactus"
#define HOST_MORE_APPS                  @"moreapps"
#define HOST_PUSH_PERMISSION            @"notification"


@interface KGSDeeplink : NSObject
@property (strong, nonatomic) UIViewController *rootViewController;

+(instancetype) sharedKGSDeeplink;

-(void) requstingPermissionForPushNotification;

- (void) requestToOpenURL:(NSURL *)url fromWindow:(UIWindow *)window;


@end
