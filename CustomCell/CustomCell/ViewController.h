//
//  ViewController.h
//  CustomCell
//
//  Created by 陈智洋 on 12-12-31.
//  Copyright (c) 2012年 卡派. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, retain) UITableView *tab;
@end
