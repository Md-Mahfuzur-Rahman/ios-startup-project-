//
//  KGSTapdaq.h
//  Typography
//
//  Created by KITE GAMES STUDIO on 10/30/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//
//  Designed By: Arefin Newaz Prince
//


#import <Foundation/Foundation.h>

#define        TAPDAQ_APP_ID            @"581dc27a292534f51a9f1d79"
#define        TAPDAQ_CLIENT_KEY        @"8b4f1555-602c-408a-bee0-5894c5debc7f"

#define TAPDAQ_AppLaunch                 @"AppLaunch"
#define TAPDAQ_AppDidEnterForeground     @"AppEnterForeground_EveryEvenTime"
#define TAPDAQ_ShowMoreApps              @"MoreApps"
#define TAPDAQ_SaveComplete              @"SaveComplete"


@interface KGSTapdaq : NSObject

@property (nonatomic, assign) BOOL boolEnableTapdaqPlace1;
@property (nonatomic, assign) BOOL boolEnableTapdaqPlace2;
@property (nonatomic, assign) BOOL boolEnableTapdaqPlace3;
@property (nonatomic, assign) BOOL boolEnableTapdaqPlace4;

+(instancetype) sharedKGSTapdaq;

-(void)initializeTapdaq;

-(void) checkTapdaqRequestForPlace:(NSString *) strTapdaqPlac;

@end
