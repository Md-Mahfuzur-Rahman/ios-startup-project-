//
//  KGPurchaseViewController.h
//  ANPPurchaseManager
//
//  Created by KITE GAMES STUDIO on 12/12/16.
//  Copyright © 2016 KITE GAMES STUDIO. All rights reserved.
//
//  Designed By: Arefin Newaz Prince
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "KGProductManager.h"
#import "KGPurchaseEventTagProtocol.h"


@protocol KGPurchaseViewControllerDelegate <NSObject>

//Call after completion of a purchase action
//
-(void) purchaseActionForProduct:(NSString *)strProduct isSuccesful:(BOOL) boolSuccessful;

- (BOOL) isInternetConnnected;

@end

@interface KGPurchaseViewController : UIViewController
<
    KGProductManagerDelegate
>

#pragma mark- Properties

@property (nonatomic, assign) id<KGPurchaseViewControllerDelegate>customDelegate;

//Will contain registered events
//
@property (nonatomic, strong) NSMutableDictionary <KGPurchaseEventTagProtocol> *eventSource;


//Blur Background
//
@property (weak, nonatomic) IBOutlet UIVisualEffectView *viewBlurBackground;

//Will contain product name
//
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;

//Button text Will contain product price
//
@property (weak, nonatomic) IBOutlet UIButton *btnBuy;

//Unlock All button
//
@property (weak, nonatomic) IBOutlet UIButton *btnUnlockAll;

//Cross button
//

@property (nonatomic, weak) IBOutlet UIButton *btnCross;

//Restore button
//

@property (nonatomic, weak) IBOutlet UIButton *btnRestore;

//Purchase Image
//

@property (nonatomic, weak) IBOutlet UIImageView *imgPurchaseBG;

//Will contain source for presenting the KGPurchaseViewController
//
@property (nonatomic, weak) NSString *strSource;

//Will contain "Product Identifier" (Must needed)
//
@property (nonatomic, weak) NSString *strProductIdentifier;

//Will contain "Unlock All Identifier" identifier (Must needed)
//
@property (nonatomic, weak) NSString *strUnlockAllIdentifier;

//Will need for disimiss KGPurchaseViewController
//
@property (nonatomic, assign) BOOL boolEnableBounce;


#pragma mark- Actions

//Unlock All button Action
//
- (IBAction)btnUnlockPressed:(id)sender;

//Product Purchase button Action
//
- (IBAction)btnBuyPressed:(id)sender;

//Cross button Action
//
- (IBAction)btnCrossPressed:(id)sender;

//Restore button Action
//
- (IBAction)btnRestorePressed:(id)sender;

+ (Class) viewControllerType;
+ (instancetype) viewControllerWithDelegate:(id)delegate identifier:(NSString *) strIdentifier source:(NSString *) strSource nib:(NSString*)nibName bundle:(NSBundle*)bundle;

-(void) presentOnViewController:(UIViewController *) viewControllerParent;

- (void) addTagEvent:(id<KGPurchaseEventTagProtocol>)tagEvent forKey:(PurchaseEventType)key;

@end
