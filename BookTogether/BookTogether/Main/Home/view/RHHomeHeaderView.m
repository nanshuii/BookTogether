//
//  RHHomeHeaderView.m
//  BookTogether
//
//  Created by 南水 on 2018/9/11.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import "RHHomeHeaderView.h"


@interface RHHomeHeaderView()

@property (nonatomic, strong) RHHomeHeader *model;

@property (nonatomic, strong) UILabel *monthAmountLabel;
@property (nonatomic, strong) UILabel *monthOutLabel;
@property (nonatomic, strong) UILabel *dayAmountLabel;
@property (nonatomic, strong) UILabel *dayOutLabel;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation RHHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame model:(RHHomeHeader *)model{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.model = model;
        self.backgroundColor = GrayBackgroundColor;
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    // 左边部分
    UIView *view = [UIView new];
    CGFloat viewWidth = self.frame.size.width - 58 - 15 - 15;
    CGFloat viewHeight = self.frame.size.height / 2; // monthView dayView
    [self addSubview:view];
    
    UIView *monthView = [UIView new];
    [view addSubview: monthView];
    
    UILabel *monthLabel = [UILabel new];
    monthLabel.font = DefaultFont;
    monthLabel.textColor = DefaultTextColor;
    monthLabel.text = @"本月";
    [monthView addSubview:monthLabel];
    
    self.monthOutLabel = [UILabel new];
    self.monthOutLabel.font = SmallFont;
    self.monthOutLabel.textColor = LightTextColor;
    [monthView addSubview:self.monthOutLabel];
    
    self.monthAmountLabel = [UILabel new];
    self.monthAmountLabel.font = SmallFont;
    self.monthAmountLabel.textColor = LightTextColor;
    [monthView addSubview:self.monthAmountLabel];
    
    UIView *dayView = [UIView new];
    [view addSubview: dayView];
    
    UILabel *dayLabel = [UILabel new];
    dayLabel.font = DefaultFont;
    dayLabel.textColor = DefaultTextColor;
    dayLabel.text = @"今日";
    [dayView addSubview:dayLabel];
    
    self.dayOutLabel = [UILabel new];
    self.dayOutLabel.font = SmallFont;
    self.dayOutLabel.textColor = LightTextColor;
    [dayView addSubview:self.dayOutLabel];
    
    self.dayAmountLabel = [UILabel new];
    self.dayAmountLabel.font = SmallFont;
    self.dayAmountLabel.textColor = LightTextColor;
    [dayView addSubview:self.dayAmountLabel];
    
    // 右边的图标
    UIView *rightView = [UIView new];
    [self addSubview:rightView];
    
    UIImageView *rightImageView = [UIImageView new];
    rightImageView.image = IMAGE(@"home_calendar");
    [rightView addSubview:rightImageView];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage1:)];
    rightView.userInteractionEnabled = YES;
    [rightView addGestureRecognizer:tap1];
    
    // 右边的第二个图标
    UIView *rightView2 = [UIView new];
    [self addSubview:rightView2];
    
    UIImageView *rightImageView2 = [UIImageView new];
    rightImageView2.image = IMAGE(@"home_calendar");
    [rightView2 addSubview:rightImageView2];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage2:)];
    rightView2.userInteractionEnabled = YES;
    [rightView2 addGestureRecognizer:tap2];
    
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.top.mas_equalTo(self.mas_top);
        make.width.mas_equalTo(viewWidth);
        make.height.mas_equalTo(self.frame.size.height);
    }];
    
    [monthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.top.mas_equalTo(view.mas_top);
        make.width.mas_equalTo(view.mas_width);
        make.height.mas_equalTo(viewHeight);
    }];
    
    [dayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.top.mas_equalTo(monthView.mas_bottom);
        make.width.mas_equalTo(view.mas_width);
        make.height.mas_equalTo(viewHeight);
    }];
    
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(monthView.mas_left);
        make.top.mas_equalTo(monthView.mas_top).offset(10);
    }];
    
    [self.monthOutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(monthLabel.mas_left);
        make.top.mas_equalTo(monthLabel.mas_bottom).offset(5);
    }];
    
    [self.monthAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.monthOutLabel.mas_right).offset(15);
        make.centerY.mas_equalTo(self.monthOutLabel.mas_centerY);
    }];
    
    [dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(dayView.mas_left);
        make.top.mas_equalTo(dayView.mas_top).offset(10);
    }];
    
    [self.dayOutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(dayLabel.mas_left);
        make.top.mas_equalTo(dayLabel.mas_bottom).offset(5);
    }];
    
    [self.dayAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dayOutLabel.mas_right).offset(15);
        make.centerY.mas_equalTo(self.dayOutLabel.mas_centerY);
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(58);
        make.top.mas_equalTo(view.mas_top);
        make.height.mas_equalTo(viewHeight);
        make.right.mas_equalTo(self.mas_right);
    }];
    
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(rightView.mas_centerX);
        make.centerY.mas_equalTo(rightView.mas_centerY);
    }];
    
    [rightView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(58);
        make.top.mas_equalTo(rightView.mas_bottom);
        make.height.mas_equalTo(viewHeight);
        make.right.mas_equalTo(self.mas_right);
    }];
    
    [rightImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(rightView2.mas_centerX);
        make.centerY.mas_equalTo(rightView2.mas_centerY);
    }];
    
    [self handleModel];
}


# pragma mark -- 更新model
- (void)updateModel:(RHHomeHeader *)model{
    self.model = model;
    [self handleModel];
}


# pragma mark -- 处理model
- (void)handleModel{
    NSString *outString = @"支出:加载中...";
    NSString *amountString = @"额度:加载中...";
    if (self.model) {
        self.monthOutLabel.text = self.model.monthOut;
        self.monthAmountLabel.text = self.model.monthAmount;
        self.dayOutLabel.text = self.model.dayOut;
        self.dayAmountLabel.text = self.model.dayAmount;
    } else {
        self.monthOutLabel.text = outString;
        self.monthAmountLabel.text = amountString;
        self.dayOutLabel.text = outString;
        self.dayAmountLabel.text = amountString;
    }
}

# pragma mark -- 点击两个不同的图标
- (void)tapImage1:(UITapGestureRecognizer *)tap{
    RHLog(@"点击了月账单图标");
    if (_months) {
        _months(9);
    }
}

- (void)tapImage2:(UITapGestureRecognizer *)tap{
    RHLog(@"点击了日支出的添加");
    if (_addDayOut) {
        _addDayOut(16);
    }
}

# pragma mark -- 头部尾部的线条
- (void)showTopLine:(BOOL)top bottomLine:(BOOL)bottomLine{
    if (top) {
        [self addSubview:self.topLine];
    }
    if (bottomLine) {
        [self addSubview:self.bottomLine];
    }
}

- (UIView *)topLine{
    if (!_topLine) {
        _topLine = [UIView new];
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, 1);
        _topLine.frame = frame;
        _topLine.backgroundColor = DefaultLineColor;
    }
    return _topLine;
}

- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        CGRect frame = CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1);
        _bottomLine.frame = frame;
        _bottomLine.backgroundColor = DefaultLineColor;
    }
    return _bottomLine;
}



@end
