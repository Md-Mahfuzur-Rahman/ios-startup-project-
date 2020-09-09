//
//  KGSLocalytics.m
//  StartUpProject
//
//  Created by Towhidul Islam on 12/26/16.
//  Copyright © 2016 Kite Games Studio. All rights reserved.
//

#import "KGSLocalytics.h"
#import <CoreDataStack/CoreDataStack.h>
#import "AnalyticsEvents.h"

@interface KGSLocalytics ()
@property (nonatomic, strong) PropertyList *list;
@end

@implementation KGSLocalytics

- (instancetype)init{
    if (self = [super init]) {
        self.list = [[PropertyList alloc] initWithFileName:@"KGSLocalytics" directoryType:NSDocumentDirectory dictionary:YES];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willTerminate:) name:UIApplicationWillTerminateNotification object:nil];
    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillTerminateNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
}

+ (instancetype) sharedInstance{
    static KGSLocalytics *local = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        local = [[KGSLocalytics alloc] init];
        [Localytics setAnalyticsDelegate:local];
    });
    
    return local;
}

+ (void)startSessionTracking{
    NSArray *keys = [(NSDictionary*)[[KGSLocalytics sharedInstance].list readOnlyCollection] allKeys];
    for (NSString *key in keys) {
        [[[KGSLocalytics sharedInstance] list] addItemToCollection:[NSNumber numberWithBool:NO] forKey:key];
    }
    //[[[KGSLocalytics sharedInstance] list] saveBackground];
}

+ (void)endSessionTracking{
    NSDictionary *source = (NSDictionary*)[[KGSLocalytics sharedInstance].list readOnlyCollection];
    [Localytics tagEvent:LC_SESSION_SUMMARY_EVENT attributes:source];
}

+ (void)updateSessionEventForKey:(NSString *)sessionKey{
    [[[KGSLocalytics sharedInstance] list] addItemToCollection:[NSNumber numberWithBool:YES] forKey:sessionKey];
}

- (void) didEnterBackground:(NSNotification*)notification{
    [[[KGSLocalytics sharedInstance] list] save];
}

- (void) willTerminate:(NSNotification*)notification{
    [KGSLocalytics endSessionTracking];
}

#pragma mark - Tag Screen Method

+ (void)tagScreen:(NSString *)screenName{
    
    [Localytics tagScreen:screenName];
}

//+ (void)addAnalyticsDelegate:(id<LLAnalyticsDelegate>)delegate{
//    
//    [Localytics setAnalyticsDelegate:delegate];
//}

+ (void)autoIntegrate:(NSString *)appKey launchOptions:(NSDictionary *)launchOptions {
    
    [Localytics autoIntegrate:appKey launchOptions:launchOptions];
    [KGSLocalytics startSessionTracking];
}

+ (void)setValue:(NSObject<NSCopying> *)value forProfileAttribute:(NSString *)attribute withScope:(LLProfileScope)scope {
    
    [Localytics setValue:value forProfileAttribute:attribute withScope: scope];
}


+ (void)setValue:(NSObject<NSCopying> *)value forProfileAttribute:(NSString *)attribute{
    
    [Localytics setValue:value forProfileAttribute:attribute];
}

+ (void)setValue:(NSString *)value forCustomDimension:(NSUInteger)dimension{
    
    [Localytics setValue:value forCustomDimension:dimension];
}

#pragma LLAnalyticsDelegate

- (void)localyticsSessionWillOpen:(BOOL)isFirst isUpgrade:(BOOL)isUpgrade isResume:(BOOL)isResume{
#warning Setup Localytics Delegate Implementation.
}

@end
