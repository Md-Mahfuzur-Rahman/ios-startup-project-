//
//  DeviceSpecifcationViewController.m
//  VideoEditor
//
//  Created by KITE GAMES STUDIO on 5/10/16.
//  Copyright © 2016 KITE GAMES STUDIO. All rights reserved.
//

#import "DeviceSpecifcationViewController.h"
#import <sys/sysctl.h>
#import "CommonConstant.h"

@interface DeviceSpecifcationViewController ()

@end

@implementation DeviceSpecifcationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - contact Mail image

-(UIImage*)getDeviceSpecificationImage {
    
    
    UIDevice *currentDevice = [UIDevice currentDevice];
    //        NSString *model = [currentDevice model];
    
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    NSString *model = [self platformType:platform];
    
    free(machine);
    
    NSString *systemVersion = [currentDevice systemVersion];
    
    NSArray *languageArray = [NSLocale preferredLanguages];
    NSString *language = [languageArray objectAtIndex:0];
    NSLocale *locale = [NSLocale currentLocale];
    NSString *country = [locale localeIdentifier];
    
    NSString *appVersion = [[NSBundle mainBundle]
                            objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    //    CFBundleShortVersionString
    
    NSString *appTitle = [[[NSBundle mainBundle]infoDictionary] valueForKey:@"CFBundleDisplayName"];
    
    //    NSString *reviewStatus = [[NSUserDefaults standardUserDefaults] boolForKey:REVIEWED_KEY]?@"YES":@"NO";
    //    NSString *purchaseStatus = [[NSUserDefaults standardUserDefaults] boolForKey:REMOVE_AD_PRODUCT_ID]?@"YES":@"NO";
    //
    //    //        NSString *footer = []
    //
    //    NSString *deviceSpecs =
    //    [NSString stringWithFormat:@"%@ - %@ - %@ - %@ - %@",
    //     model, systemVersion, language, country, appVersion];
    //
    //    NSLog(@"Device Specs --> %@",deviceSpecs);
    
    
    [self.lblAppTitle setText:[NSString stringWithFormat:@"Support for %@",appTitle]];
    //    [self.appTitle setText:appTitle];
    [self.lblAppVersion setText:appVersion];
    [self.lblDeviceModel setText:model];
    [self.lblIOSVersion setText:systemVersion];
    [self.lblPrefferedLanguage setText:language];
    [self.lblCountry setText:country];
    //    self.reviewStatus.hidden = (![[NSUserDefaults standardUserDefaults] boolForKey:REVIEWED_KEY])?YES:NO;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:IS_RATED]) {
        self.lblReviewStatus.hidden = NO;
    }
    else{
        self.lblReviewStatus.hidden = YES;
    }
    
    // may be need
    /*
    if ( [[NSUserDefaults standardUserDefaults] boolForKey:IAP_PRODUCT_UNLOCKALL]) {
        
        self.lblInAppStatus.hidden = NO;
    }
    else {
        self.lblInAppStatus.hidden = YES;
    }
     */
    //    self.inAppStatus.hidden = (![[NSUserDefaults standardUserDefaults] boolForKey:REMOVE_AD_PRODUCT_ID])?YES:NO;
    [self.lblBundleId setText:[NSString stringWithFormat:@"%@  ||  %@",[[NSBundle mainBundle]bundleIdentifier],ITUNES_APPID]];
    
    return [self imageFromView:self.viewDeviceSpecView];
}

- (UIImage*)imageFromView:(UIView *)view
{
    @autoreleasepool {
        
    // Create a graphics context with the target size
    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
    
    CGSize imageSize = [view bounds].size;
    //    if (NULL != UIGraphicsBeginImageContextWithOptions)
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    //    else
    //        UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[view layer] renderInContext:context];
    
    // Restore the context
    //    CGContextRestoreGState(context);
    
    // Retrieve the screenshot image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //imageView2.image=image;
    
    return image;
    }//end of autorelease 
}

- (NSString *) platformType:(NSString *)platform
{
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini 2G (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini 2G (Cellular)";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad Mini 3 (WiFi)";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad Mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad Mini 3 (China)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    if ([platform isEqualToString:@"AppleTV2,1"])   return @"Apple TV 2G";
    if ([platform isEqualToString:@"AppleTV3,1"])   return @"Apple TV 3";
    if ([platform isEqualToString:@"AppleTV3,2"])   return @"Apple TV 3 (2013)";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}

@end
