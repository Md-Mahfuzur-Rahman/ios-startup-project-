//
//  KGPurchasableProduct.h
//  ANPPurchaseManager
//
//  Created by KITE GAMES STUDIO on 12/13/16.
//  Copyright © 2016 KITE GAMES STUDIO. All rights reserved.
//
//
//  Designed By: Arefin Newaz Prince
//  Description: Contain information of a Product
//

#import <Foundation/Foundation.h>

@interface KGPurchasableProduct : NSObject

@property (nonatomic, strong) NSString *strProductIdentifier;

@property (nonatomic, strong) NSString *strProductName;

@property (nonatomic, strong) NSString *strProductPrice;

@property (nonatomic, strong) NSString *strProductTitle;

@property (nonatomic, strong) NSString *strProductDescription;

@property (nonatomic, strong) NSString *strProductType;

@property (nonatomic, assign) BOOL boolIsUnlockAllProduct;

@property (nonatomic, assign) BOOL boolIsAlreadyPurchased;

//Dictonary should contain objectForKey according to the same name of property variable
//
-(instancetype) initWithDictonaryInfo: (NSDictionary *)dictInfo;

-(instancetype) initWithIdentifier:(NSString *)strIdentifier andName:(NSString *)strName;

@end
