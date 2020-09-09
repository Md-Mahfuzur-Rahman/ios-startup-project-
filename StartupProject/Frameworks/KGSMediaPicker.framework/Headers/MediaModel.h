//
//  MediaModel.h
//  KITE Media Picker
//
//  Created by KITE GAMES STUDIO LTD on 10/5/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Photos;

@interface MediaModel : NSObject

+ (instancetype)initMediaModelWithPHAsset:(PHAsset*) asset;

-(PHAsset*) getMediaAsset;

-(PHAssetMediaType) getMediaType;

-(NSString*) getMediaIdentifier;

-(BOOL) isModelSelected;

-(void) setIsMediaSelected: (BOOL) isSelected;

-(NSString*) getVedioDurationString;

@end
