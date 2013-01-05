//
//  ViewController.h
//  cell
//
//  Created by 陈智洋 on 13-1-1.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoView.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, retain) UITableView *tab;
@property(nonatomic, retain) InfoView *infoView;
@end
