//
//  RHHomeHandle.m
//  BookTogether
//
//  Created by 南水 on 2018/9/11.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import "RHHomeHandle.h"
#import "RHHome.h"
#import "RHAmount.h"
#import "RHHomeHeader.h"

@implementation RHHomeHandle

# pragma mark -- 假的首页数据
+ (NSMutableArray *)fakerHomeData{
    NSMutableArray *array = [NSMutableArray array];
    RHHome *home0 = [RHHome new];
    home0.userId = @"0001";
    home0.createTime = @"2018-09-11 15:46:53";
    home0.tags = [NSMutableArray arrayWithArray:@[@"饮食", @"一周消费一次", @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"]];
    home0.money = -10.00;
    home0.name = @"单行备注";
    home0.remark = @"这是一个单行的备注";
    [array addObject:home0];
    
    RHHome *home1 = [RHHome new];
    home1.userId = @"0001";
    home1.createTime = @"2018-09-10 15:46:53";
    home1.tags = [NSMutableArray arrayWithArray:@[@"饮食", @"一周消费一次", @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"]];
    home1.money = -10.00;
    home1.name = @"哈哈哈哈";
    home1.remark = @"是一个多行的备注是一个多行的备注是一个多行的备注是一个多行的备注是一个多行的备注是一个多行的备注是一个多行的备注";
    [array addObject:home1];
    
    RHHome *home2 = [RHHome new];
    home2.userId = @"0001";
    home2.createTime = @"2018-09-11 10:46:53";
    home2.tags = [NSMutableArray arrayWithArray:@[@"饮食", @"一周消费一次", @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"]];
    home2.money = 10.00;
    home2.name = @"哈哈哈哈";
    [array addObject:home2];
    
    RHHome *home3 = [RHHome new];
    home3.userId = @"0001";
    home3.createTime = @"2018-09-11 12:46:53";
    home3.money = 10.00;
    home3.name = @"哈哈哈哈";
    [array addObject:home3];
    
    RHHome *home4 = [RHHome new];
    home4.userId = @"0001";
    home4.createTime = @"2018-09-10 12:46:53";
    home4.tags = [NSMutableArray arrayWithArray:@[@"饮食", @"一周消费一次", @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"]];
    home4.money = 10.00;
    home4.name = @"哈哈哈哈";
    [array addObject:home4];
    
    [array addObject:home0];
    [array addObject:home1];
    [array addObject:home3];
    [array addObject:home4];
    [array addObject:home4];
    [array addObject:home2];
    [array addObject:home3];
    [array addObject:home1];
    
    return array;
}

# pragma mark -- 对首页中的标题栏的数据的操作
+ (RHHomeHeader *)createHomeHeaderWithMonthOut:(float)monthOut monthAmount:(float)monthAmount dayOut:(float)dayOut dayAmount:(float)dayAmount{
    RHHomeHeader *model = [RHHomeHeader new];
    NSString *monthOutString = [NSString stringWithFormat:@"支出:%.2f", monthOut];
    model.monthOut = monthOutString;
    
    NSString *dayOutString = [NSString stringWithFormat:@"支出:%.2f", dayOut];
    model.dayOut = dayOutString;
    
    NSString *monthAmountString = [NSString stringWithFormat:@"额度:%.2f", monthAmount];
    if (monthOut <= monthAmount) {
        float percent = (monthOut / monthAmount) * 100;
        monthAmountString = [NSString stringWithFormat:@"%@ %.0f%@", monthAmountString, percent, @"%"];
    } else {
        float beyound = monthOut - monthAmount;
        monthAmountString = [NSString stringWithFormat:@"%@ 超支%.2f", monthAmountString, beyound];
    }
    model.monthAmount = monthAmountString;
    
    NSString *dayAmountString = [NSString stringWithFormat:@"额度:%.2f", dayAmount];
    if (dayOut <= dayAmount) {
        float percent = (dayOut / dayAmount) * 100;
        dayAmountString = [NSString stringWithFormat:@"%@ %.0f%@", dayAmountString, percent, @"%"];
    } else {
        float beyound = dayOut - dayAmount;
        dayAmountString = [NSString stringWithFormat:@"%@ 超支%.2f", dayAmountString, beyound];
    }
    model.dayAmount = dayAmountString;
    return model;
}

# pragma mark -- 假的家庭各项支出
- (NSMutableArray *)fakerFamilyMonthData{
    NSMutableArray *array = [NSMutableArray array];
    RHAmount *amount1 = [RHAmount new];
    amount1.userId = @"00001";
    amount1.planMoney = 10000;
    amount1.outMoney = 15000;
    
    return array;
}

- (NSMutableArray *)fakerFamilyDayData{
    NSMutableArray *array = [NSMutableArray array];
    
    
    return array;
}


@end
