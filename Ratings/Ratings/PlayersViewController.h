//
//  PlayersViewController.h
//  Ratings
//
//  Created by 陈智洋 on 13-4-9.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDetailsViewController.h"

@interface PlayersViewController : UITableViewController<playerDetailsViewControllerDelegate>

@property(nonatomic, strong) NSMutableArray *players;
@end
