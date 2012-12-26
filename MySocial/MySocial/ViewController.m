//
//  ViewController.m
//  MySocial
//
//  Created by 陈智洋 on 12-12-26.
//  Copyright (c) 2012年 卡派. All rights reserved.
//

#import "ViewController.h"
#import "UMSocialBar.h"

@interface ViewController ()
{
    UMSocialBar *mySocialBar;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UMSocialData *mySocialData = [[UMSocialData alloc] initWithIdentifier:@"mySccialData" withTitle:@"mySocialData标题"];
    mySocialBar = [[UMSocialBar alloc] initWithUMSocialData:mySocialData withViewController:self];
    
    [self.view addSubview:mySocialBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
