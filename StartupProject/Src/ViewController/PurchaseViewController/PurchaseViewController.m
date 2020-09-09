//
//  PurchaseViewController.m
//  StartUpProject
//
//  Created by Towhidul Islam on 12/22/16.
//  Copyright © 2016 Kite Games Studio. All rights reserved.
//

#import "PurchaseViewController.h"

@implementation PurchaseViewController

- (void)dealloc{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

+ (Class)viewControllerType{
    return [self class];
}

- (void)setImgPurchaseBG:(UIImageView *)imgPurchaseBG{
#warning TODO PurchaseViewController setup
    imgPurchaseBG.image = [UIImage imageNamed:@"Purchase_UI_VID.png"];
}

@end
