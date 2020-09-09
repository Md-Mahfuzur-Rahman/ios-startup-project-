//
//  UIView+Processor.m
//  KGCustomCategories
//
//  Created by KITE GAMES STUDIO LTD on 12/20/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import "UIView+Processor.h"

@implementation UIView (Processor)

- (UIImage *) kgs_snapshotView
{
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    [self drawViewHierarchyInRect: self.bounds afterScreenUpdates: YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
