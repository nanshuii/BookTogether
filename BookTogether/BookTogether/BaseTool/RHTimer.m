//
//  RHTimer.m
//  RHBaseProject
//
//  Created by 戴梦仁 on 2018/7/29.
//  Copyright © 2018年 🐷 🐷. All rights reserved.
//

#import "RHTimer.h"

@implementation RHTimer

+ (void)dispatchDelayWithTime:(int)time after:(doSomething)after{
    int64_t delayTime = time;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayTime * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        after(time);
    });
}
    
@end
