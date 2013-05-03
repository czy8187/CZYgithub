//
//  Observer.m
//  kvo_kvc_test
//
//  Created by 陈智洋 on 13-5-2.
//  Copyright (c) 2013年 南京瀚和. All rights reserved.
//

#import "Observer.h"
#import "myself.h"

@implementation Observer

-(void) observeValueForKeyPath:(NSString *)keyPath //属性名
                      ofObject:(id)object //被关注的对象
                        change:(NSDictionary *)change
                       context:(void *)context
{

    if ([keyPath isEqual:@"mName"]) {
        NSLog(@"\n我是观察者:\n以前的值是：%@\n现在的值是：%@",[change objectForKey:NSKeyValueChangeOldKey],[change objectForKey:NSKeyValueChangeNewKey]);
    }
}
@end
