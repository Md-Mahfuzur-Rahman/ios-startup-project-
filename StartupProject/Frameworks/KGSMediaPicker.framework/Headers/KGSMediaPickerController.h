//
//  KGSMediaPickerController.h
//  KITE Media Picker
//
//  Created by KITE GAMES STUDIO LTD on 10/4/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoManager.h"
#import "CustomAlbumButton.h"
#import "AlbumModel.h"
#import "MediaPickerBroadcastProtocol.h"
#import "InternetConnection.h"
#import "Media.h"

typedef NS_ENUM(NSInteger, ButtonType){
    
    BUTTON_ALBUM = 101,
    BUTTON_ALBUM_SELECTED,
    BUTTON_SELECTED,
    BUTTON_CAMERA,
    BUTTON_DONE,
    BUTTON_CANCEL
};

typedef enum KGSPAlert {
    
    KGSPALERT_UNSUPPORTED_VIDEO,
    KGSPALERT_ICLOUD_VIDEO,
    KGSPALERT_NO_INTERNET,
    KGSPALERT_ICLOUD_PHOTO
    
}KGSPICKER_ALERT;

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define INTERNET_ALLER_TITTLE           @"No Internet!"
#define INTERNET_ALLER_TEXT             @"There is no internet connection. Please connect and try again."

@protocol KGSMediaPickerControllerDelegate <NSObject>

/*     send its delegate to an array of picked Media as Model object     */
-(void) mediaPicker:(KGSMediaPickerController *) KGSMediaPickerController
                didFinishPickingMediaWithInfo: (NSArray<Media*> *) arrInfo;

/*   when picker cancel button pressed */
-(void) mediaPickerCancelPressed;

/*  ask for picker limitation*/
-(NSInteger) maxSelectedMedia;

/*     ask for desired image size*/
-(CGSize) selectedImageSize;

@optional

-(BOOL) mediaPicker: (KGSMediaPickerController *) pickerController shouldSelectMediaItem : (NSInteger) count;

-(NSDictionary*) provideFonts;

-(void) mediaPickerWillStartFetching;

@end

@interface KGSMediaPickerController : UIViewController

@property (nonatomic, strong) PhotoManager                  *photoManager;

+ (instancetype) mediaPickerController:(MediaType)type delegate:(id<KGSMediaPickerControllerDelegate>) delegate;

/* add a delegate of MediaPickerBroadcastProtocol*/

- (void) subscribe:(id<MediaPickerBroadcastProtocol>)subscriber;

/* remove a delegate of MediaPickerBroadcastProtocol*/

- (void) removeSubscription:(id<MediaPickerBroadcastProtocol>)subscriber;

@end
