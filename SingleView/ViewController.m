//
//  ViewController.m
//  SingleView
//
//  Created by Mahfuz on 9/9/20.
//  Copyright © 2020 KITE GAMES STUDIO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)btnPressed:(id)sender {

    UIAlertController* alert = [UIAlertController alertControllerWithTitle: nil
                                                                   message: @"test"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          }];
    [alert addAction:defaultAction];
//    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault
//
//                                                         handler:^(UIAlertAction * action) {
//                                                             NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//                                                             UIApplication *application = [UIApplication sharedApplication] ;
//
//                                                             if([application canOpenURL: url])
//                                                                 [application openURL: url];
//                                                         }
//                                   ];
//    [alert addAction:cancelAction];
    
    [self presentViewController: alert animated: YES completion: nil];

}


@end
