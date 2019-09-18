//
//  UILabel+DynamicCalculationSize.h
//  RHBaseProject
//
//  Created by 🐷 🐷 on 2018/7/27.
//  Copyright © 2018年 🐷 🐷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DynamicCalculationSize)

/**
 计算UILabel高度
 */
- (CGFloat)dynamicCalculationHeightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth text:(NSString *)text;

/**
 计算UILabel高度
 */
- (CGFloat)dynanucCalculationHeight;

@end
