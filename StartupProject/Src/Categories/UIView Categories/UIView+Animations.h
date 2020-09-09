//
//  UIView+Animations.h
//  KGCustomCategories
//
//  Created by KITE GAMES STUDIO LTD on 12/20/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AnimationCompletionHandler)(void);


@interface UIView (Animations)

//apply bounce animation on UIView
-(void) kgs_bounceViewWithAnimationTime: (NSTimeInterval) sec completionHandler: (AnimationCompletionHandler) completionHandler ;

@end
