//
//  UIView+KGFeatures.h
//  KGCustomCategories
//
//  Created by KITE GAMES STUDIO LTD on 12/20/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AnimationCompletionHandler)(void);

@interface UIView (Appearance)

//appear view with fade in animation
-(void) kgs_viewFadeInWithDuration: (NSTimeInterval) sec completionHandler:(AnimationCompletionHandler) completionHandler;

//appear view with fade out animation
-(void) kgs_viewFadeOutWithDuration: (NSTimeInterval) sec completionHandler:(AnimationCompletionHandler) completionHandler;

@end
