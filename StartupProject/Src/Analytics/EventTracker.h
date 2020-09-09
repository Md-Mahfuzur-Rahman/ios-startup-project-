//
//  EventTracker.h
//  Photo-Collage
//
//  Created by Tuhin Kumer on 9/6/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "Amplitude.h"
#import <Localytics/Localytics.h>

@interface EventTracker : NSObject


#pragma mark - Event Tagging


/** Tag an event
 @param eventName The name of the event which occurred.
 */
+ (void)tagEvent:(NSString *)eventName;


/** Tag an event with attributes
 @param eventName The name of the event which occurred.
 @param attributes An object/hash/dictionary of key-value pairs, contains
 contextual data specific to the event.
 */
+ (void)tagEvent:(NSString *)eventName attributes:(NSDictionary *)attributes;


/** Allows a session to tag a particular event as having occurred.
 @param eventName The name of the event which occurred.
 @param attributes (Optional) An object/hash/dictionary of key-value pairs, contains
 contextual data specific to the event.
 @param customerValueIncrease (Optional) Numeric value, added to customer lifetime value.
 Integer expected. Try to use lowest possible unit, such as cents for US currency.
 */
+ (void)tagEvent:(NSString *)eventName attributes:(NSDictionary *)attributes customerValueIncrease:(NSNumber *)customerValueIncrease;


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
