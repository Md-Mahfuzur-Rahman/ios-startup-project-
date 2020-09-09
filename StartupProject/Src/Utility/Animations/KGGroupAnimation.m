//
//  KGSAnimationHandlers.m
//  KGCustomCategories
//
//  Created by KITE GAMES STUDIO LTD on 12/21/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import "KGGroupAnimation.h"

@interface Animations ()

@property (nonatomic, assign) NSTimeInterval sec;
@property (nonatomic, strong) AnimationsBlock animationBlock;

@end

@implementation Animations

+(instancetype) initWithDuration:(NSTimeInterval) sec animation:(AnimationsBlock) animationBlock{
    
    Animations *animation = [Animations new];
    animation.sec = sec;
    animation.animationBlock = animationBlock;
    return animation;
}

-(NSTimeInterval) getDuration{
    
    return self.sec;
}

-(AnimationsBlock) getAnimationBlock{
    
    return self.animationBlock;
}

@end


@interface KGGroupAnimation ()

@property (nonatomic, strong) NSMutableArray *arrAnimations;

@end

@implementation KGGroupAnimation

#pragma mark - Property Getter - Setters

-(NSMutableArray*) arrAnimations{
    
    if(_arrAnimations == nil){
        
        _arrAnimations = [NSMutableArray new];
    }
    
    return _arrAnimations;
}

#pragma mark - Execute Queued Animations

-(void) addAnimationWithDuration:(NSTimeInterval) sec
                       animation:(AnimationsBlock)animations{
    
    Animations *animation = [Animations initWithDuration: sec animation: animations];
    [self.arrAnimations addObject: animation];
}

-(void) startAnimations:(CompletionHandler) onCompletion{
    
    [self executeAnimationBlockAtIndex: 0 CompletionHandler: onCompletion];
}

-(void) executeAnimationBlockAtIndex:(NSInteger)iIndexNo CompletionHandler:(CompletionHandler) onCompletion{
    
    //queued execution ended
    if (iIndexNo == self.arrAnimations.count) {
        
        [self.arrAnimations removeAllObjects];
        if(onCompletion)
            onCompletion();
        return;
    }
    else{
        
        Animations *animation = [self.arrAnimations objectAtIndex: iIndexNo];
        [UIView animateWithDuration: animation.getDuration
                         animations: animation.getAnimationBlock
                         completion: ^(BOOL finished) {
                             [self executeAnimationBlockAtIndex: iIndexNo+1 CompletionHandler: onCompletion];
                         }
         ];
    }
}

@end
