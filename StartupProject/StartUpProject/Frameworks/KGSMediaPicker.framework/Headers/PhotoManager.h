//
//  PhotoManager.h
//  KITE Media Picker
//
//  Created by KITE GAMES STUDIO LTD on 10/4/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AlbumModel.h"

typedef NS_ENUM(NSInteger, MediaType){
    ALL,
    PHOTOS,
    VIDEOS
};

@protocol PhotoManagerDelegate <NSObject>

// access to the photo library is enabled or disabled
-(void) userAuthorized: (BOOL) flag;

// if there is no photos or videos in the library, it tells the delegate to show Empty library related message
-(void) showEmptyMediaWarning;

// if photolibrary changed ,it send change object to the delegate
-(void) photoLibraryChanged:(PHChange *) changeInstance;

// if there is any photo or video in the library, it tells the delegate to hide Empty library related message
-(void) hideEmptyMediaWarning;

// when user first time authorized photo library access
-(void) firstTimeAuthorization;

@end

@interface PhotoManager : NSObject

+ (instancetype) photoManagerWithType:(MediaType)type
                             delegate:(id<PhotoManagerDelegate>)delegate;
- (void)unregisterPhotoManager;

-(AlbumModel*) getAlbumModelAtIndex: (NSInteger) iIndexNo;

-(NSInteger) getAlbumCount;

-(MediaType) getMediaType;

-(BOOL) isUserAuthorized;

- (NSIndexPath*) findIndexPath:(AlbumModel*)model;

-(AlbumModel*) newAlbumModelForOldModel:(AlbumModel*)oldModel;

-(BOOL) mediaExist:(NSString *) mediaIdentifier;

-(void) selectModel:(NSString*) mediaIdentifier;

-(void) setIsMediaSelected: (BOOL) flag withModelIdentifier:(NSString*) strIdentifier;

-(void) reset;

@end
