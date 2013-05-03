//
//  ViewController.m
//  kvo_kvc_test
//
//  Created by 陈智洋 on 13-5-2.
//  Copyright (c) 2013年 南京瀚和. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    mySelf =[[myself alloc] init];
    Observer *mObserver= [[Observer alloc]init];
    
    [mySelf addObserver: mObserver forKeyPath:@"mName"options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    
    
    @try{
        [ mySelf setValue:@"珠元玉睿"forKey:@"mName"]; //改变了对象属性 通知了观察者
    }
    @catch(NSException *exception) {//NSUnknownKeyException未发现对象的属性 异常
        NSLog([exception name],nil);
    }
    
    
    //我的名字
    NSLog(@"我的名字%@",[ myself valueForKey:@"mName"]);
    
    //触发观察者回调函数
    mySelf.mName=@"珠元玉睿";
    
    //这种方法不会触发 通知观察者
    [mySelf changeMe];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
