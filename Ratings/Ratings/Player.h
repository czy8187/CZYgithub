//
//  Player.h
//  Ratings
//
//  Created by 陈智洋 on 13-4-9.
//  Copyright (c) 2013年 卡派. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, assign) int rating;
@end
