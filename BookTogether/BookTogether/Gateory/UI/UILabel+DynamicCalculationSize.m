//
//  UILabel+DynamicCalculationSize.m
//  RHBaseProject
//
//  Created by 🐷 🐷 on 2018/7/27.
//  Copyright © 2018年 🐷 🐷. All rights reserved.
//

#import "UILabel+DynamicCalculationSize.h"

@implementation UILabel (DynamicCalculationSize)

- (CGFloat)dynamicCalculationHeightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth text:(NSString *)text{
    CGFloat labelWidth = (maxWidth > 0) ? maxWidth : self.bounds.size.width;
    UIFont *labelFont = (font != nil) ? font : self.font;
    NSString *labelText = (text != nil) ? text : self.text;
    CGFloat height = [labelText boundingRectWithSize:CGSizeMake(labelWidth, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:labelFont} context:nil].size.height;
    return height;
}

- (CGFloat)dynanucCalculationHeight{
    CGFloat height = [self dynamicCalculationHeightWithFont:nil maxWidth:0 text:nil];
    return height;
}


@end
