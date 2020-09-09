//
//  MediaCollectionViewController.h
//  KITE Media Picker
//
//  Created by KITE GAMES STUDIO LTD on 10/6/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerStoryboard.h"
#import "MediaModel.h"
#import "KGSMediaPickerController.h"
#import "AlbumModel.h"

@protocol MediaCollectionViewDelegate <NSObject>

// when a photo or video is selcted from collection
-(void) pickedModel: (MediaModel*) mediaModel;

// check a particular photo or video is alreadyselcted
-(BOOL) isMediaAlreadyPicked: (NSString*) mediaIdentifier;

-(void) btnCameraPressed;

@end

@interface MediaCollectionViewController : UICollectionViewController<MediaPickerBroadcastProtocol>

//class instantiate method
+ (instancetype) initWithStoryBoard:(PickerStoryboard*)pickerStoryboard photoManager:(PhotoManager*) phManager delegate:(id <MediaCollectionViewDelegate>) delegate;

-(void) reload;

@end
