//
//  KGSPickerPresenter.h
//  Slideshow-Maker
//
//  Created by Towhidul Islam on 11/16/16.
//  Copyright © 2016 KITE GAMES STUDIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KGSMediaPicker/KGSMediaPicker.h>

@interface KGSPickerPresenter : NSObject
+ (instancetype) sharedInstance;
- (void) presentPickerOn:(UIViewController*)presenter mediaType:(MediaType)type;
- (void) presentPickerOn:(UIViewController*)presenter mediaType:(MediaType)type showSetting:(BOOL)shouldShow;
- (BOOL) userAccessAuthorized;
- (void) askForAuthorization:(MediaType)type onCompletion:(void (^)())completion;
@end
