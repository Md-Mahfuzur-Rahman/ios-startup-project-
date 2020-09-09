//
//  Media.h
//  KITE Media Picker
//
//  Created by KITE GAMES STUDIO LTD on 10/13/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
@import  Photos;
typedef NS_ENUM(NSInteger, FetchCompletionStatus) {
    Successfull,
    Unsupported,
    NoInternet
};

@interface Media : NSObject

@property (nonatomic, assign) FetchCompletionStatus fetchCompletionStatus;

+ (instancetype)initMediaWithPHAsset:(PHAsset*) asset image: (UIImage*) image;

+ (instancetype)initMediaWithPHAsset:(PHAsset*) asset Video: (AVAsset*) video;

+ (instancetype)initMediaWithPHAsset:(PHAsset*) asset;

-(PHAssetMediaType) getMediaType;

-(NSString*) getMediaIdentifier;

-(UIImage*) getMediaImage;

-(AVAsset*) getMediaVideoAsset;

-(void) setImage: (UIImage*) img;

-(void) setAvAsset: (AVAsset*) asset;



-(PHAsset*) getAsset;

@end
