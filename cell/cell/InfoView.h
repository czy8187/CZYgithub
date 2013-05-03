//
//  InfoView.h
//  cell
//
//  Created by 陈智洋 on 13-1-2.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoView : UIView
{
    IBOutlet   UIImageView *detailImageView;
    IBOutlet   UIImageView *starImageView;
    IBOutlet   UILabel *bankLabel;
    IBOutlet   UILabel *rebateLabel;
    IBOutlet   UILabel *addressLabel;
    IBOutlet   UILabel *telLabel;
    IBOutlet   UILabel *officeHoursLabel;
    IBOutlet   UILabel *parkLabel;
}
@property(nonatomic, retain) IBOutlet   UIImage *detailImage;
@property(nonatomic, retain) IBOutlet   UIImage *starImage;
@property(nonatomic, retain) IBOutlet   NSString *bank;
@property(nonatomic, retain) IBOutlet   NSString *rebate;
@property(nonatomic, retain) IBOutlet   NSString *address;
@property(nonatomic, retain) IBOutlet   NSString *tel;
@property(nonatomic, retain) IBOutlet   NSString *officeHours;
@property(nonatomic, retain) IBOutlet   NSString *park;
@end
