//
//  ViewController.m
//  UISwitchTest
//
//  Created by 陈智洋 on 13-3-14.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UISwitch *mySwitch;
    BOOL setting;
}
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    [mySwitch setOn:setting animated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 50, 30)];
//    [mySwitch setOn:NO animated:YES];
    [mySwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:mySwitch];
}
- (void)switchValueChanged:(id)sender
{
    UISwitch *controlSwitch = (UISwitch *)sender;
//    controlSwitch = mySwitch;
    setting = controlSwitch.on;
    if (setting)
    {
        NSLog(@"ON");
    }
    else
    {
        NSLog(@"OFF");
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
