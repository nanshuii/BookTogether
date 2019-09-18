//
//  RHHomeHeaderView.h
//  BookTogether
//
//  Created by 南水 on 2018/9/11.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHHomeHeader.h"

@interface RHHomeHeaderView : UIView

@property (nonatomic, copy) void (^months)(int currentMonth);
@property (nonatomic, copy) void (^addDayOut)(int currentDay);

- (instancetype)initWithFrame:(CGRect)frame model:(RHHomeHeader *)model;

- (void)updateModel:(RHHomeHeader *)model;

- (void)showTopLine:(BOOL)top bottomLine:(BOOL)bottomLine;

@end
