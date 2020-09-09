//
//  KGSTapdaq.m
//  Typography
//
//  Created by KITE GAMES STUDIO on 10/30/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//
//
//  Designed By: Arefin Newaz Prince
//

#import "KGSTapdaq.h"
#import <Tapdaq/Tapdaq.h>

@implementation KGSTapdaq


+(instancetype) sharedKGSTapdaq {
    
    static KGSTapdaq *kgsTapdaq = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        kgsTapdaq = [[KGSTapdaq alloc] init];
        
        NSLog(@"Tapdaq SingleTon : Init");
        
        
    });
    
    return kgsTapdaq;
    
}

-(instancetype)init {
    
    self = [super init];
    
    if(self) {
        
        
    }
    
    return self;
}

-(void)initializeTapdaq {
    
    TDProperties *tapdaqProps = [[TDProperties alloc] init];
    
#ifdef DEBUG
    [tapdaqProps setTestMode:YES];
#endif
    
    TDPlacement *placement_1 = [[TDPlacement alloc] initWithAdTypes:TDAdTypeInterstitial forTag: TAPDAQ_AppLaunch];
    
    TDPlacement *placement_2 = [[TDPlacement alloc] initWithAdTypes:TDAdTypeInterstitial forTag: TAPDAQ_AppDidEnterForeground];
    
    TDPlacement *placement_3 = [[TDPlacement alloc] initWithAdTypes:TDAdTypeInterstitial forTag: TAPDAQ_ShowMoreApps];
    
    TDPlacement *placement_4 = [[TDPlacement alloc] initWithAdTypes:TDAdTypeInterstitial forTag: TAPDAQ_SaveComplete];
    
    // You can register an array of placements in one statement
    [tapdaqProps registerPlacements:@[ placement_1, placement_2, placement_3, placement_4]];
    
    
    [[Tapdaq sharedSession] setApplicationId: TAPDAQ_APP_ID clientKey: TAPDAQ_CLIENT_KEY properties:tapdaqProps];
    
    
    self.boolEnableTapdaqPlace1 = YES;
    self.boolEnableTapdaqPlace2 = NO;
    self.boolEnableTapdaqPlace3 = YES;
    self.boolEnableTapdaqPlace4 = YES;
    
}


-(void) checkTapdaqRequestForPlace:(NSString *) strTapdaqPlace {
    
    if([strTapdaqPlace isEqualToString: TAPDAQ_AppLaunch]) {
        
        if(self.boolEnableTapdaqPlace1 == YES) {
            
            [[Tapdaq sharedSession] showInterstitialForPlacementTag: TAPDAQ_AppLaunch];
            
            self.boolEnableTapdaqPlace1 = NO;
            
        }
        
    }
    
    if([strTapdaqPlace isEqualToString: TAPDAQ_AppDidEnterForeground]) {
        
        if (self.boolEnableTapdaqPlace2 == NO) {
            
            self.boolEnableTapdaqPlace2 = YES;
            
        } else {
            
            [[Tapdaq sharedSession] showInterstitialForPlacementTag: TAPDAQ_AppDidEnterForeground];
            
            self.boolEnableTapdaqPlace2 = NO;
        }
        
    }
    
    if([strTapdaqPlace isEqualToString: TAPDAQ_ShowMoreApps]) {
        
        if(self.self.boolEnableTapdaqPlace3 == YES) {
            
            [[Tapdaq sharedSession] showInterstitialForPlacementTag: TAPDAQ_ShowMoreApps];
            
        }
        
    }
    
    if([strTapdaqPlace isEqualToString: TAPDAQ_SaveComplete]) {
        
        if(self.self.boolEnableTapdaqPlace4 == YES) {
            
            [[Tapdaq sharedSession] showInterstitialForPlacementTag: TAPDAQ_SaveComplete];
            
        }
    }
    
}

@end
