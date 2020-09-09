//
//  BaseSaveMedia.h
//  MediaShareController
//
//  Created by Tuhin Kumer on 12/15/16.
//  Copyright © 2016 KITE GAMES STUDIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SaveProtocol.h"


typedef enum {
    IMAGE,
    VIDEO,
    OTHERSTYPE
} MEDIA;

@interface BaseSave : NSObject <SaveProtocol>

-(PHAssetCollection *) getAlbum:(NSString *)strAlbumName;
- (void) createAlbum:(NSString*)albumName onCompletion:(void (^)(BOOL, NSError *))completion;
-( MEDIA ) getMediaType : (NSURL*)mediaUrl;

@end
