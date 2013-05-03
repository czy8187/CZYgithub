//
//  PlayerCell.m
//  Ratings
//
//  Created by 陈智洋 on 13-4-9.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import "PlayerCell.h"

@implementation PlayerCell
@synthesize nameLabel;
@synthesize gameLabel;
@synthesize ratingImageView;
//
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
