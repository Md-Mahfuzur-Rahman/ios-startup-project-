//
//  ColorListController.h
//  StartUpProject
//
//  Created by Towhidul Islam on 26/12/16.
//  Copyright © 2016 KITE GAMES STUDIO LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef struct{
    float Red, Green, Blue;
} RGB;

@interface ColorBank : NSObject
+ (UIColor *)colorFromHexString:(NSString *)hexString;
+ (UIColor*) colorForkey:(NSString*)key;
+ (RGB) rgbComponentsForKey:(NSString*)key;
+ (RGB) rgbComponentsForHexString:(NSString *)hexString;
@end

//Color keys, which have to use with ColorBank "+colorForkey:".
//There are lots more, almost 141 color name and their hexa value in the list.
//The list was copied from http://www.w3schools.com/tags/ref_color_tryit.asp?
//Please visit that link to find more color keys.
#define AliceBlue @"AliceBlue"
#define Aqua @"Aqua"
#define Aquamarine @"Aquamarine"
#define MediumAquaMarine @"MediumAquaMarine"
#define Black @"Black"
#define Blue @"Blue"
#define Brown @"Brown"
#define Cyan @"Cyan"
#define Gray @"Gray"
#define Green @"Green"
#define Orange @"Orange"
#define Pink @"Pink"
#define Purple @"Purple"
#define Red @"Red"
#define Silver @"Silver"
#define White @"White"
#define Yellow @"Yellow"
#define Gold @"Gold"
#define LightGoldenRodYellow @"LightGoldenRodYellow"
