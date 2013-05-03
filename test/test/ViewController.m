//
//  ViewController.m
//  test
//
//  Created by 陈智洋 on 13-3-27.
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
    int p,sum=0;
	int i=1;
	while(i<=10)	{
        p=p+i;
		sum=sum+p;
		i++;	}
    printf("sum=%d\n",sum);
//	return 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
