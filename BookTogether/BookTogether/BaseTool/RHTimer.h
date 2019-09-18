//
//  RHTimer.h
//  RHBaseProject
//
//  Created by 戴梦仁 on 2018/7/29.
//  Copyright © 2018年 🐷 🐷. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^doSomething)(int code);

@interface RHTimer : NSObject


/**
 dispater_after 延迟n秒后进入主队列
 */
+ (void)dispatchDelayWithTime:(int)time after:(doSomething)after;


@end
