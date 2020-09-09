//
//  PurchaseViewPresenter.h
//  StartUpProject
//
//  Created by Towhidul Islam on 12/22/16.
//  Copyright © 2016 Kite Games Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PurchaseViewPresenter : NSObject
//+ (instancetype) sharedInstance;
+ (void) presentOn:(UIViewController*)viewController productIdentifier:(NSString*)strItentifier source:(NSString*)strSource;
+ (void) dismiss;
+ (void) restoreTransactions;
@end
