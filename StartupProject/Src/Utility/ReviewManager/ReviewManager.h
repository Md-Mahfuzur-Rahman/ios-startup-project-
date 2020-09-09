//
//  ReviewManager.h
//  PhotoInwstragram
//
//  Created by KITE GAMES STUDIO on 2/16/15.
//  Copyright (c) 2015 KITE GAMES STUDIO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReviewManager : NSObject

+ (id)sharedInstance;
-(void)checkReviewStatusWithParse;
@property (nonatomic)BOOL boolShowReviewAlert;
@end
