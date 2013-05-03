//
//  ViewController.m
//  KapaiPush
//
//  Created by 陈智洋 on 13-2-27.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
//去除标记
- (void)viewDidAppear:(BOOL)animated
{
//    int badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
//    if(badge > 0)
//    {
//        badge--;
//        [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
//    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
