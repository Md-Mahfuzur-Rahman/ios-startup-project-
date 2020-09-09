//
//  AlbumModel.h
//  KITE Media Picker
//
//  Created by KITE GAMES STUDIO LTD on 10/4/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MediaModel.h"
@import Photos;

@interface AlbumModel : NSObject

+ (instancetype)initAlbumModelWithIdentifier:(NSString*)identifier
                             assetCollection:(PHFetchResult*)
                       fetchResult albumName:(NSString*) strAlbumName
                                  mediaCount:(NSInteger) iMediaCount;

@property   (nonatomic, strong)     NSString            *localIdentifier;

-(PHFetchResult*) getAssetCollection;

-(NSString *) getAlbumName;

-(NSInteger) getMediaCount;

-(PHAsset*) getAssetForThumb;

-(BOOL) isAlbumSelected;

-(void) setIsAlbumSelected: (BOOL) isSelected;

-(MediaModel*)getMediaModelAtIndex: (NSInteger)iIndexNo;

@end
