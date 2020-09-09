//
//  EventTracker.m
//  Photo-Collage
//
//  Created by Tuhin Kumer on 9/6/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import "EventTracker.h"
#import "KGSLocalytics.h"



@implementation EventTracker


+ (void)tagEvent:(NSString *)eventName{
    
    //[Localytics tagEvent: eventName];

    [FBSDKAppEvents logEvent:eventName];
}


+ (void)tagEvent:(NSString *)eventName attributes:(NSDictionary *)attributes{
    
   // [Localytics tagEvent: eventName attributes:attributes];
    
    [FBSDKAppEvents logEvent:eventName parameters:attributes];
}


+ (void)tagEvent:(NSString *)eventName attributes:(NSDictionary *)attributes customerValueIncrease:(NSNumber *)customerValueIncrease{
    
    //customerValueIncrease = 2.99	// By Redoan
    float usCent = customerValueIncrease.floatValue*100;
    NSNumber *ltv = [NSNumber numberWithInt:(int)usCent];
    
    //[Localytics tagEvent:eventName attributes:attributes customerValueIncrease:ltv];
    
    [FBSDKAppEvents logEvent:eventName parameters:attributes];
}


#pragma mark - Tag Screen Method

+ (void)tagScreen:(NSString *)screenName{
    
    //[Localytics tagScreen:screenName];
}

//+ (void)addAnalyticsDelegate:(id<LLAnalyticsDelegate>)delegate{
//    
//    [Localytics addAnalyticsDelegate: delegate];
//}

+ (void)autoIntegrate:(NSString *)appKey launchOptions:(NSDictionary *)launchOptions {
    
    //[Localytics autoIntegrate:appKey launchOptions:launchOptions];
}

+ (void)setValue:(NSObject<NSCopying> *)value forProfileAttribute:(NSString *)attribute withScope:(LLProfileScope)scope {
    
    //[Localytics setValue:value forProfileAttribute:attribute withScope: scope];
}


+ (void)setValue:(NSObject<NSCopying> *)value forProfileAttribute:(NSString *)attribute{
    
    //[Localytics setValue:value forProfileAttribute:attribute];
}

+ (void)setValue:(NSString *)value forCustomDimension:(NSUInteger)dimension{
    
   // [Localytics setValue:value forCustomDimension:dimension];
}

@end
