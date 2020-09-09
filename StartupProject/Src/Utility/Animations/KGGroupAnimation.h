//
//  KGSAnimationHandlers.h
//  KGCustomCategories
//
//  Created by KITE GAMES STUDIO LTD on 12/21/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^AnimationsBlock)(void);

typedef void (^CompletionHandler)(void);

@interface Animations : NSObject

+(instancetype) initWithDuration:(NSTimeInterval) sec animation:(AnimationsBlock) animationBlock;

-(NSTimeInterval) getDuration;

-(AnimationsBlock) getAnimationBlock;

@end

@interface KGGroupAnimation : NSObject

//add an animation insturction block to the queue with animation time
-(void) addAnimationWithDuration:(NSTimeInterval) sec animation:(AnimationsBlock)animations ;

//start executing queued uiview animations and fire CompletionHandler block at the end of the exection process
-(void) startAnimations:(CompletionHandler) onCompletion;

@end
