//
//  KGPurchaseEventTag.h
//  ANPPurchaseManager
//
//  Created by KITE GAMES STUDIO on 12/18/16.
//  Copyright © 2016 KITE GAMES STUDIO. All rights reserved.
//
//  Designed By: Arefin Newaz Prince
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PurchaseEventType) {
    PurchaseStart,
    PurchaseComplete,
    RestoreStart,
    RestoreComplete,
    PurchaseModulePresented,
    PurchaseModuleDismissed,
    PurchaseScreenTag
};

@protocol KGPurchaseEventTagProtocol <NSObject>

- (void) execute:(NSDictionary*)source;

@end
