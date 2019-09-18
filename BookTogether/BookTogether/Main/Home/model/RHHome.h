//
//  RHHome.h
//  BookTogether
//
//  Created by 南水 on 2018/9/11.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHHome : NSObject

// 日常支出类

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSMutableArray *tags; // 分类
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, assign) float money;
@property (nonatomic, copy) NSString *remark; // 备注

@end
