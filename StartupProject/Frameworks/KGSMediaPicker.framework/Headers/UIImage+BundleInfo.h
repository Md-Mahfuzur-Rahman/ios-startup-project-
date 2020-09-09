//
//  UIImage+BundleInfo.h
//  KITE Media Picker
//
//  Created by KITE GAMES STUDIO LTD on 10/5/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BundleInfo)

+ (UIImage*) kgs_imageWithName:(NSString*)name;
- (UIImage *)scaleAndRotate;

@end
