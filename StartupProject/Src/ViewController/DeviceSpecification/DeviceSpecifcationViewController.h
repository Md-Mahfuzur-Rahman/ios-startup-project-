//
//  DeviceSpecifcationViewController.h
//  VideoEditor
//
// Created/modified by                              Date                   Purpose
//
// Md. Kamal Uddin                                 5/10/16              generate device secification image
//

/*
 
 Description: This class will generate a image with device secification. We use this image with contact email attachment.
 
 Sample Code for using this class:
 
 DeviceSpecifcationViewController *controller = [[DeviceSpecifcationViewController alloc] initWithNibName:@"DeviceSpecifcationViewController" bundle:nil];
 
 [self.view addSubview:controller.view];
 controller.view.hidden = YES;
 UIImage *imgDeviceSpecImage = [controller getDeviceSpecificationImage];
 [controller.view removeFromSuperview];
 
 */


#import <UIKit/UIKit.h>

@interface DeviceSpecifcationViewController : UIViewController
// Device information for Contact us mail
@property (weak, nonatomic) IBOutlet UIView *viewDeviceSpecView;
@property (weak, nonatomic) IBOutlet UILabel *lblAppTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblAppVersion;
@property (weak, nonatomic) IBOutlet UILabel *lblDeviceModel;
@property (weak, nonatomic) IBOutlet UILabel *lblIOSVersion;
@property (weak, nonatomic) IBOutlet UILabel *lblPrefferedLanguage;
@property (weak, nonatomic) IBOutlet UILabel *lblInAppStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblReviewStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblCountry;
@property (weak, nonatomic) IBOutlet UILabel *lblBundleId;


-(UIImage*)getDeviceSpecificationImage;
@end
