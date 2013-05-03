//
//  myself.h
//  kvo_kvc_test
//
//  Created by 陈智洋 on 13-5-2.
//  Copyright (c) 2013年 南京瀚和. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myself : NSObject
{
    NSString *mName;
}
@property(nonatomic,retain) NSString *mName;
-(void) changeMe;
-(id) init;
@end
