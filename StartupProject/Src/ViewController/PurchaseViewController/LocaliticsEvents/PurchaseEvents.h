//
//  BeginPurchase.h
//  StartUpProject
//
//  Created by Towhidul Islam on 12/22/16.
//  Copyright © 2016 Kite Games Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KGPurchaseView/KGPurchaseView.h>

@interface BeginPurchase : NSObject <KGPurchaseEventTagProtocol>

@end

////////////////////////////////////////////////////////////////

@interface EndPurchase : NSObject <KGPurchaseEventTagProtocol>

@end

////////////////////////////////////////////////////////////////

@interface BeginRestore : NSObject <KGPurchaseEventTagProtocol>

@end

////////////////////////////////////////////////////////////////

@interface EndRestore : NSObject <KGPurchaseEventTagProtocol>

@end

////////////////////////////////////////////////////////////////

@interface PurchasePresented : NSObject <KGPurchaseEventTagProtocol>

@end

////////////////////////////////////////////////////////////////

@interface PurchaseDismissed : NSObject <KGPurchaseEventTagProtocol>

@end

////////////////////////////////////////////////////////////////

@interface PurchaseScreen : NSObject <KGPurchaseEventTagProtocol>

@end

////////////////////////////////////////////////////////////////

