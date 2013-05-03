//
//  InfoView.m
//  cell
//
//  Created by 陈智洋 on 13-1-2.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import "InfoView.h"

@implementation InfoView
@synthesize detailImage;
@synthesize starImage;
@synthesize bank,rebate,address,tel,officeHours,park;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
//        btn.frame = CGRectMake(0, 0, 40, 40);
//        [self addSubview:btn];
    }
    return self;
}
//重写set方法
- (void)setDetailImage:(UIImage *)detail
{
    if (![detail isEqual:detailImage]) {
        detailImage = [detail copy];
        detailImageView.image = detailImage;
    }
}
- (void)setStarImage:(UIImage *)star
{
    if (![star isEqual:starImage]) {
        starImage = [star copy];
        starImageView.image = starImage;
    }
}
- (void)setBank:(NSString *)b
{
    if (![b isEqual:bank]) {
        bank = [b copy];
        bankLabel.text = bank;
    }
}
- (void)setRebate:(NSString *)r
{
    if (![r isEqual:rebate]) {
        rebate = [r copy];
        rebateLabel.text = rebate;
    }
}
- (void)setAddress:(NSString *)a
{
    if (![a isEqual:address]) {
        address = [a copy];
        addressLabel.text = a;
    }
}
- (void) setTel:(NSString *)t
{
    if (![t isEqual:tel]) {
        tel = [t copy];
        telLabel.text = tel;
    }
}
- (void) setOfficeHours:(NSString *)o
{
    if (![o isEqual:officeHours]) {
        officeHours = [o copy];
        officeHoursLabel.text = officeHours;
    }
}
- (void) setPark:(NSString *)p
{
    if (![p isEqual:park]) {
        park = [p copy];
        parkLabel.text = park;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
