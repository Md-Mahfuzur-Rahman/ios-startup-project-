//
//  KGProductManager.h
//  ANPPurchaseManager
//
//  Created by KITE GAMES STUDIO on 12/13/16.
//  Copyright © 2016 KITE GAMES STUDIO. All rights reserved.
//
//
//  Designed By: Arefin Newaz Prince
//  Description: Manage Purchasable produt related things
//

#import <Foundation/Foundation.h>
#import "KGPurchasableProduct.h"
#import "KGPurchaseController.h"
#import <StoreKit/StoreKit.h>

typedef NS_ENUM(NSInteger, KGProductType) {
    
    KGProductType_Generic,
    KGProductType_Custom
    
};
@protocol KGProductManagerDelegate <NSObject>

//Call after completion of a purchase action
//
-(void) purchaseActionForProduct:(NSString *)strProduct isSuccesful:(BOOL)boolSuccessful;

-(void) restoreActionForProduct:(NSString *)strProduct isSuccesful:(BOOL)boolSuccessful;

-(void) restoreProductsActionCompleteSuccessfully:(BOOL) boolSuccessfully;

-(void) updatePriceForIdentifier:(NSString *) strProduct;

@end

@interface KGProductManager : NSObject<SKProductsRequestDelegate, KGPurchaseControllerDelegate>

@property (nonatomic, assign) id<KGProductManagerDelegate>customDelegate;

@property (nonatomic, strong) NSBundle *plistBundle;

//Singleton
+(void) restoreTransactionObserver;

+(instancetype) sharedInstance;

+(instancetype) sharedInstanceWithPlist:(NSString *)plist fromBundle:(NSBundle*)bundle ofProductType:(Class)type;



//Add Single Product with product identifier and name
//
-(void) addProductWithIdentifier:(NSString *)strIdentifier andName:(NSString *)strName;

//Add "Unlock All" Product with product identifier and name
//
-(void) addUnlockAllProductWithIdentifier:(NSString *)strIdentifier andName:(NSString *)strName;


//Add all Products from Plist
//
-(void) loadPurchasableProductsFromPlist:(NSString *)strPlistName;


//Get a product by its identifier
//
-(KGPurchasableProduct *) getProductOfIdentifier:(NSString *)strIdentifier;

//Checking:
//
-(BOOL) isProductOfIdentifierPurchased:(NSString *)strIdentifier;


-(void) printAllProducts;


#pragma mark- Purchase Methods
//Request for product price
//
- (void)requestToStoreWithIdentifiers:(NSArray *)identifiers;

//Request to purchase a product
//
-(void) purchaseProductOfIdentifier:(NSString *)strProductId;

//Request to restore products
//
-(void) restoreProducts;

//Return Unlock All Identifier
//
-(KGPurchasableProduct *) getProductOfType:(NSString *)strType;

@end
