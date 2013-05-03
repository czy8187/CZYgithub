//
//  PlayerCell.h
//  Ratings
//
//  Created by 陈智洋 on 13-4-9.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *gameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *ratingImageView;
@end
