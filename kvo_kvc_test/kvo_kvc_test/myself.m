//
//  myself.m
//  kvo_kvc_test
//
//  Created by 陈智洋 on 13-5-2.
//  Copyright (c) 2013年 南京瀚和. All rights reserved.
//

#import "myself.h"

@implementation myself
@synthesize mName;
- (void) changeMe
{
    mName = @"改变自己！！";
}
- (id) init
{
    self = [super init];
    if (self) {
        mName = [[NSString alloc] initWithFormat:@"%@",@"悲酥清风~"];
    }
    return  self;
}
@end
