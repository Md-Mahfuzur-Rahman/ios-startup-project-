//
//  PurchaseViewPresenter.m
//  StartUpProject
//
//  Created by Towhidul Islam on 12/22/16.
//  Copyright © 2016 Kite Games Studio. All rights reserved.
//

#import "PurchaseViewPresenter.h"
#import "PurchaseViewController.h"
#import "PurchaseEvents.h"

@interface PurchaseViewPresenter () <KGPurchaseViewControllerDelegate>
@property (nonatomic, weak) UIViewController *presenter;
@property (nonatomic, strong) PurchaseViewController *purchaseController;
@end

@implementation PurchaseViewPresenter

+ (instancetype)sharedInstance{
    static PurchaseViewPresenter *presenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        presenter = [[PurchaseViewPresenter alloc] init];
    });
    return presenter;
}

+ (void)presentOn:(UIViewController *)viewController productIdentifier:(NSString *)strItentifier source:(NSString *)strSource{
    [PurchaseViewPresenter sharedInstance].presenter = viewController;
    PurchaseViewController *controller = [PurchaseViewController viewControllerWithDelegate:[PurchaseViewPresenter sharedInstance] identifier:strItentifier source:strSource nib:NSStringFromClass([PurchaseViewController class]) bundle:[NSBundle bundleForClass:[PurchaseViewController class]]];
    
    [controller addTagEvent:[BeginPurchase new] forKey:PurchaseStart];
    [controller addTagEvent:[EndPurchase new] forKey:PurchaseComplete];
    [controller addTagEvent:[BeginRestore new] forKey:RestoreStart];
    [controller addTagEvent:[EndRestore new] forKey:RestoreComplete];
    [controller addTagEvent:[PurchasePresented new] forKey:PurchaseModulePresented];
    [controller addTagEvent:[PurchaseDismissed new] forKey:PurchaseModuleDismissed];
    [controller addTagEvent:[PurchaseScreen new] forKey:PurchaseScreenTag];
    
    [PurchaseViewPresenter sharedInstance].purchaseController = controller;
    [PurchaseViewPresenter sharedInstance].presenter.modalPresentationStyle = UIModalPresentationCurrentContext;
    [[PurchaseViewPresenter sharedInstance].presenter presentViewController:controller animated:YES completion:nil];
}

- (BOOL)isInternetConnnected{
#warning TODO PurchaseViewController Setup
    return true;
}

- (void)purchaseActionForProduct:(NSString *)strProduct isSuccesful:(BOOL)boolSuccessful{
#warning TODO PurchaseViewController Setup
    NSLog(@"%@ purchased", strProduct);
    
    [PurchaseViewPresenter dismiss];
}

+ (void)dismiss{
    [[PurchaseViewPresenter sharedInstance].purchaseController dismissViewControllerAnimated:YES completion:^{
        [PurchaseViewPresenter sharedInstance].purchaseController = nil;
    }];
}

+ (void)restoreTransactions{
    [KGProductManager restoreTransactionObserver];
}

@end
