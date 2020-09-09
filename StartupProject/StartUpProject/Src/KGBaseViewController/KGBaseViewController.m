//
//  KGBaseViewController.m
//  StartUpProject
//
//  Created by Towhidul Islam on 12/27/16.
//  Copyright © 2016 Kite Games Studio. All rights reserved.
//

#import "KGBaseViewController.h"
#import "EventTracker.h"

@interface KGBaseViewController ()

@end

@implementation KGBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [EventTracker tagScreen:[self title]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)title{
    return NSStringFromClass([self class]);
}

@end
