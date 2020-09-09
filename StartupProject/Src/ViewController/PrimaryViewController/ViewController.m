//
//  ViewController.m
//  StartUpProject
//
//  Created by Tuhin Kumer on 12/7/16.
//  Copyright © 2016 Kite Games Studio. All rights reserved.
//

#import "ViewController.h"
#import "PurchaseViewPresenter.h"
#import "KGSPickerPresenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)testPurchaseView:(UIButton *)sender {
    //[PurchaseViewPresenter presentOn:self productIdentifier:@"XYZ" source:@"ViewController"];
    [[KGSPickerPresenter sharedInstance] presentPickerOn:self mediaType:PHOTOS];
}

- (IBAction)dismiss:(UIButton *)sender {
    
}

@end
