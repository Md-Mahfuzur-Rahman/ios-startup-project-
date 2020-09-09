//
//  ReviewManager.m
//  PhotoInwstragram
//
//  Created by KITE GAMES STUDIO on 2/16/15.
//  Copyright (c) 2015 KITE GAMES STUDIO. All rights reserved.
//

#import "ReviewManager.h"
//#import <Parse/Parse.h>

@interface ReviewManager()
//@property (nonatomic, copy) void (^yesBlock)(void);
//@property (nonatomic, copy) void (^noBlock)(void);
//@property (nonatomic, copy) void (^errorBlock)(NSError*error);
@end

@implementation ReviewManager

+ (id)sharedInstance
{
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];

        
    });
    
    // returns the same object each time
    
    return _sharedObject;
}

-(id)init
{
    self = [super init];
    if(self)
    {
        
//        [Parse setApplicationId:@"7uyPWhLHNyKHaFjAPmBysQ0t5VZPUIVijrulBago"
//                      clientKey:@"anddMk846YwN6siUQmAl84z2YKDtUnJlWpdjtWTQ"];
    }
    return self;
}

//-(void)queryTimeOut:(PFQuery *)query withYesBlock:(void (^)(void))yesBlock
//{
//    NSLog(@"%s", __FUNCTION__);
//    [query cancel];
//    yesBlock();
//    self.boolShowReviewAlert = YES;
//}


-(void)checkReviewStatusWithParse
{
    //Update: Should add "Bundle display name" in info.plist
    //
//    PFQuery *query=[PFQuery queryWithClassName:@"RATING_RULES"];
//    
//    [query whereKey:@"BUNDLE_ID" equalTo:[[NSBundle mainBundle] bundleIdentifier]];
//    
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        
//        
//        int j=0;
//
//        if (!error) {
//            //test=YES;
//            NSLog(@"total result %d",objects.count);
//            for (int i=0;i<[objects count];i++)
//            {
//                NSDictionary *a= [ objects objectAtIndex:i];
//                NSString *version=a[ @"VERSION"];
//                
//                
//                NSString *v=[[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"];
//                
//                if([v isEqual:version])
//                {
//                    Boolean test=[a[@"SHOW_REVIEW_ALERT"]boolValue];
//                    
//                    if (!test) {
//                        
//                        self.boolShowReviewAlert = NO;
//                        j++;
//                        break;
//                    }
//                    else
//                    {
//                        
//                        self.boolShowReviewAlert = YES;
//                        j++;
//                        break;
//                    }
//                    
//                }
//                
//                
//                //}
//                
//                ///////
//                
//            }
//            if(j==0){
//                PFObject *ab=[PFObject objectWithClassName:@"RATING_RULES"];
//                NSLog(@"bundleId: %@", [[NSBundle mainBundle]bundleIdentifier]);
//                NSLog(@"AppsName: %@", [[[NSBundle mainBundle]infoDictionary] valueForKey:@"CFBundleDisplayName"]);
//                NSLog(@"Version: %@", [[[NSBundle mainBundle]infoDictionary] valueForKey:@"CFBundleShortVersionString"]);
//                [ab setObject:[[NSBundle mainBundle]bundleIdentifier] forKey:@"BUNDLE_ID"];
//                [ab setObject:[[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleDisplayName"] forKey:@"APP_NAME"];
//                [ab setObject:[[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"] forKey:@"VERSION"];
//                [ab setObject:@(NO) forKey:@"SHOW_REVIEW_ALERT"];
//                [ab save];
//                
//                self.boolShowReviewAlert = NO;
//            }
//        }
//        
//        else{
//            self.boolShowReviewAlert = NO;
//            NSLog(@"ERROR : %@", error);
//        }
//        
//        
//        
//    }];
    
    
    
}



@end
