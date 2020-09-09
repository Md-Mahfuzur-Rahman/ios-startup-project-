//
//  UIView+KGFeatures.m
//  KGCustomCategories
//
//  Created by KITE GAMES STUDIO LTD on 12/20/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import "UIView+AppearanceStyles.h"

@implementation UIView (AppearanceStyles)


-(void) kgs_viewFadeInWithDuration: (NSTimeInterval) sec completionHandler:(AnimationCompletionHandler) completionHandler{
    
    [UIView animateWithDuration: sec animations:^{
        
         self.alpha = 1.0;
        
    }
     completion:^(BOOL finished) {
         
          if(completionHandler)
              completionHandler();
     }];
}

-(void) kgs_viewFadeOutWithDuration: (NSTimeInterval) sec completionHandler:(AnimationCompletionHandler) completionHandler{
    
    [UIView animateWithDuration: sec animations:^{
        
        self.alpha = 0.0;
    }
     completion:^(BOOL finished) {
         
         if(completionHandler)
             completionHandler();
     }];
    
}

@end
