//
//  RHSelectAndSearchHeaderView.h
//  BookTogether
//
//  Created by 南水 on 2018/9/11.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHSelectAndSearchHeaderView : UIView

@property (nonatomic, copy) void (^searchTag)(BOOL search);
@property (nonatomic, copy) void (^selectTag)(NSInteger tag);

- (instancetype)initWithFrame:(CGRect)frame selects:(NSArray *)selects search:(BOOL)search;

- (void)showTopLine:(BOOL)top bottomLine:(BOOL)bottomLine;

@end
