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
@property(nonatomic, retain) IBOutlet   UIImageView *detailImageView;
@property(nonatomic, retain) IBOutlet   UIImageView *starImageView;
@property(nonatomic, retain) IBOutlet   UILabel *bankLabel;
@property(nonatomic, retain) IBOutlet   UILabel *rebateLabel;
@property(nonatomic, retain) IBOutlet   UILabel *addressLabel;
@property(nonatomic, retain) IBOutlet   UILabel *telLabel;
@property(nonatomic, retain) IBOutlet   UILabel *officeHoursLabel;
@property(nonatomic, retain) IBOutlet   UILabel *parkLabel;
@end
