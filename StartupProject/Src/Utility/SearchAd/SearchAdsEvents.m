//
//  SearchAdsEvents.m
//  Photo-Collage
//
//  Created by Towhidul Islam on 11/10/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import "SearchAdsEvents.h"
#import <iAd/iAd.h>
#import "EventTracker.h"


#define IAD_ATTRIBUTION				@"iad-attribution"



@implementation SearchAdsEvents{
    BOOL boolLoging;
}

+ (instancetype)sharedInstance{
    static SearchAdsEvents *_defaultInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultInstance = [SearchAdsEvents new];
        _defaultInstance->boolLoging = true;
    });
    return _defaultInstance;
}

- (void)trackSearchAdAttributes{
    
    if ([[ADClient sharedClient] respondsToSelector:@selector(requestAttributionDetailsWithBlock:)]) {
        [[ADClient sharedClient] requestAttributionDetailsWithBlock:^(NSDictionary *attributionDetails, NSError *error) {
            
            if (error == nil) {
                
                BOOL bVal = (BOOL)[self getValueForKey:attributionDetails key:IAD_ATTRIBUTION];
                
                if (bVal)
                {
                	[EventTracker  tagEvent:SEARCH_AD_ATTRIBUTION_EVENT ];
                }

                if (boolLoging)
                    NSLog(@"SearchAds Attribution : %@", attributionDetails);
                
            }else{
                if (boolLoging)
                    NSLog(@"%s at %d : %@",__FUNCTION__,__LINE__,[error debugDescription]);
            }
        }];
    }
    
}

- (void)shouldLogging:(BOOL)enable{
    boolLoging = enable;
}


- (id) getValueForKey:(NSDictionary*) dic key:(NSString*)strKey
{
    // Dictionary representation is as follows & we need value of "iad-attribution" key.
    /*
     {
     "Version3.1" = {
     "iad-attribution" = true;
     "iad-org-name" = "Light Right";
     .......
     };
     }
     */
    
    id 			val, obj;
    NSArray 	*keys = [dic allKeys];
    
    for (int i = 0;i < [keys count]; i++){
        
        obj = [dic objectForKey: [keys objectAtIndex:i] ];
        
        if ([obj isKindOfClass: [NSDictionary class] ] == YES) {
        	
            NSDictionary *dictemp = (NSDictionary *)obj;
            val = [dictemp valueForKey: strKey];
            
            if (val != nil)
                break;
        }
    }

    return val;
}



@end
