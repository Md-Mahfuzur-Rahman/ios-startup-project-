//
//  SearchAdsEvents.h
//  Photo-Collage
//
//  Created by Towhidul Islam on 11/10/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <Foundation/Foundation.h>


#define SEARCH_AD_ATTRIBUTION_EVENT                 @"Search ads attribution event"


@interface SearchAdsEvents : NSObject

+ (instancetype) sharedInstance;

- (void) trackSearchAdAttributes;

- (void) shouldLogging:(BOOL)enable;

@end
