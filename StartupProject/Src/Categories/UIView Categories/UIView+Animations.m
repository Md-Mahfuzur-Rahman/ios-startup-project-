//
//  UIView+Animations.m
//  KGCustomCategories
//
//  Created by KITE GAMES STUDIO LTD on 12/20/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import "UIView+Animations.h"

@implementation UIView (Animations)


-(void) kgs_bounceViewWithAnimationTime: (NSTimeInterval) sec completionHandler: (AnimationCompletionHandler) completionHandler{
    

    [UIView animateWithDuration:sec animations:^{
        
        self.layer.transform = CATransform3DMakeScale( 0.75, 0.75, 1.0);
    
    }completion:^(BOOL finished) {
    
        [UIView animateWithDuration: sec
                              delay: 0
             usingSpringWithDamping: .45
              initialSpringVelocity: sec
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             
                                self.layer.transform = CATransform3DIdentity;
                         }
                         completion:^(BOOL finished) {
                             
                             if(completionHandler)
                                 completionHandler();
                         }];
        }];
}

@end
