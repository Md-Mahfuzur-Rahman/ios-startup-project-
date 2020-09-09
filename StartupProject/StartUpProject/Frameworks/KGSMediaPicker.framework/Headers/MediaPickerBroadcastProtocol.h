//
//  MediaPickerBroadcastProtocol.h
//  KITE Media Picker
//
//  Created by KITE GAMES STUDIO LTD on 10/10/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Media.h"
@class KGSMediaPickerController;

@protocol MediaPickerBroadcastProtocol <NSObject>
@optional

// notify its delegates when a album selected
- (void) mediaPicker:(KGSMediaPickerController*)controller selectedAlbum:(AlbumModel*) album;

// notify its delegates when photo library changed
- (void) mediaPicker:(KGSMediaPickerController*)controller photoLibraryChanged:(PHChange *)changeInstance;

//ask collectionview to reload a specific indexpath
- (void) mediaPicker:(KGSMediaPickerController*)controller refreshMediaCollectionForMediaModel: (Media*)mediaModel;

//ask delegates  to select cameraroll album
- (void) mediaPicker:(KGSMediaPickerController*)controller selectCameraRollAlbum: (NSString*)strName;

@end
