//
//  UIImage+Operations.h
//  KGCustomCategories
//
//  Created by KITE GAMES STUDIO LTD on 12/20/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Operations)

// return image from a specific bundle
+(UIImage*) kgs_imageWithName: (NSString*) name inBundle: (NSBundle*) bundle;

//rotate image to UIImageOrientationUp
-(UIImage *) kgs_scaleAndRotate;

//if image is completely black
-(BOOL) kgs_isBlackImage;

//flip the image from top to bottom
-(UIImage*) kgs_flipImageTopToBottomOfImage;

//flip the image from left to right
-(UIImage*) kgs_flipImageLeftToRightOfImage;

//rotate the image in 90deg clockwise direction
-(UIImage*) kgs_rotateImageClockWiseOfImage;

//Resize the image to given size
- (UIImage *) kgs_resizeImageWithSize:(CGSize)newSize;

@end
