//
//  KGSLocalytics.h
//  StartUpProject
//
//  Created by Towhidul Islam on 12/26/16.
//  Copyright © 2016 Kite Games Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Localytics/Localytics.h>

@interface KGSLocalytics : NSObject <LLAnalyticsDelegate>

+ (void) startSessionTracking;

+ (void) endSessionTracking;

+ (void) updateSessionEventForKey:(NSString*)sessionKey;

#pragma mark - Tag Screen Method

/** Allows tagging the flow of screens encountered during the session.
 @param screenName The name of the screen
 */
+ (void)tagScreen:(NSString *)screenName;


/** Add an Analytics delegate
 @param delegate An object implementing the LLAnalyticsDelegate protocol. Multiple objects
 can be delegates, and each one will receive callbacks.
 */
//+ (void)addAnalyticsDelegate:(id<LLAnalyticsDelegate>)delegate;


/** Auto-integrates the Localytic SDK into the application.
 @param appKey The unique key for each application generated at www.localytics.com
 @param launchOptions The launchOptions provided by application:DidFinishLaunchingWithOptions:
 */
+ (void)autoIntegrate:(NSString *)appKey launchOptions:(NSDictionary *)launchOptions;


/** Sets the value of a profile attribute.
 @param attribute The name of the profile attribute to be set
 @param scope The scope of the attribute governs the visability of the profile attribute (application
 only or organization wide)
 */
+ (void)setValue:(NSObject<NSCopying> *)value forProfileAttribute:(NSString *)attribute withScope:(LLProfileScope)scope;

+ (void)setValue:(NSObject<NSCopying> *)value forProfileAttribute:(NSString *)attribute;

+ (void)setValue:(NSString *)value forCustomDimension:(NSUInteger)dimension;

@end
