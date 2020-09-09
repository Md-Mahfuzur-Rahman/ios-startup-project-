//
//  UIView+Effects.m
//  KGCustomCategories
//
//  Created by KITE GAMES STUDIO LTD on 12/20/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import "UIView+Effects.h"

@implementation UIView (Effects)


-(void) kgs_setShadow{
    
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 2.0;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect: self.bounds].CGPath;
    
}

-(void) kgs_setShadowWithColor:(UIColor *)color{
    
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [color CGColor];
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowRadius = 2.0;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect: self.bounds].CGPath;
    
}

-(void) kgs_roundShapeWithCornerRadius:(CGFloat) flRadius{
    
     self.layer.masksToBounds = NO;
     self.layer.cornerRadius = flRadius;

    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect: self.bounds cornerRadius: flRadius].CGPath ;
}

-(void) kgs_addBlurEffectWithStyle:(UIBlurEffectStyle) blurEffectStyle{
    
    self.backgroundColor = [UIColor clearColor];
    
    for(UIView *viewSub in self.subviews){
        
        viewSub.backgroundColor = [UIColor clearColor];
    }
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle: blurEffectStyle];
    UIVisualEffectView *viewVisualEffect = [[UIVisualEffectView alloc] initWithEffect: blurEffect];
    viewVisualEffect.frame = CGRectMake( 0, 0, self.frame.size.width, self.frame.size.height);
    [self insertSubview: viewVisualEffect atIndex: 0];

}

-(void) kgs_setGradientColor:(UIColor *)colorTop withColor:(UIColor *)colorBottom {
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorTop.CGColor, colorBottom.CGColor, nil];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = self.bounds;
    
    gradient.colors = colors;
    
    [self.layer insertSublayer:gradient atIndex:0];
    
}

@end
