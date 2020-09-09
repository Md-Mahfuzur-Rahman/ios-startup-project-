//
//  UIView+Effects.h
//  KGCustomCategories
//
//  Created by KITE GAMES STUDIO LTD on 12/20/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Effects)

//set Blackshadow effect to view layer
-(void) kgs_setShadow;

//set given color shadow effect to view layer
-(void) kgs_setShadowWithColor:(UIColor *)color;

// make the view round shape from given corner radius value.
-(void) kgs_roundShapeWithCornerRadius:(CGFloat) flRadius;

//add blur effect to the view and make itself and its subviews background color to clear color
-(void) kgs_addBlurEffectWithStyle:(UIBlurEffectStyle) blurEffectStyle;

//add gradiant effect to view's layer
-(void) kgs_setGradientColor:(UIColor *)colorTop withColor:(UIColor *)colorBottom;

@end
