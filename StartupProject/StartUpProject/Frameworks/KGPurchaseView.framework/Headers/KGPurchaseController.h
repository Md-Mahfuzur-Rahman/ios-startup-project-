//
//  KGPurchaseController.h
//  ANPPurchaseManager
//
//  Created by KITE GAMES STUDIO on 12/13/16.
//  Copyright © 2016 KITE GAMES STUDIO. All rights reserved.
//
//  Designed By: Arefin Newaz Prince
//  Description: Controll purchase action of Product
//
#import <Foundation/Foundation.h>

@protocol KGPurchaseControllerDelegate <NSObject>

//Call after completion of a purchase action
//
-(void) purchaseActionForProduct:(NSString *)strProduct isSuccesful:(BOOL) boolSuccessful;

-(void) restoreActionForProduct:(NSString *)strProduct isSuccesful:(BOOL)boolSuccessful;

-(void) restoreProductsActionCompleteSuccessfully:(BOOL) boolSuccessfully;

@end

@interface KGPurchaseController : NSObject

@property (nonatomic, assign) id<KGPurchaseControllerDelegate>customDelegate;

+(instancetype) sharedInstance;


//Request to purchase a product
//
-(void) purchaseProductOfIdentifier:(NSString *)strProductId;

//Request to restore products
//
-(void) restoreProducts;

@end
