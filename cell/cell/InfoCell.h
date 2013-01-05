//
//  InfoCell.h
//  cell
//
//  Created by 陈智洋 on 13-1-1.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoCell : UITableViewCell

@property(nonatomic, retain) IBOutlet   UIImageView *detailImageView;
@property(nonatomic, retain) IBOutlet   UIImageView *starImageView;
@property(nonatomic, retain) IBOutlet   UILabel *bankLabel;
@property(nonatomic, retain) IBOutlet   UILabel *rebateLabel;
@property(nonatomic, retain) IBOutlet   UILabel *addressLabel;
@property(nonatomic, retain) IBOutlet   UILabel *telLabel;
@property(nonatomic, retain) IBOutlet   UILabel *officeHoursLabel;
@property(nonatomic, retain) IBOutlet   UILabel *parkLabel;
@end
