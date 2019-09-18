//
//  RHNoDataView.m
//  BookTogether
//
//  Created by 南水 on 2018/9/11.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import "RHNoDataView.h"

@interface RHNoDataView()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation RHNoDataView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        self.title = title;
        self.frame = frame;
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    [self addSubview:self.imageView];
    [self addSubview:self.label];
    [self makeConstraints];
    
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.image = IMAGE(@"noData");
    }
    return _imageView;
}

- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.text = self.title;
        _label.font = BigFont;
        _label.textColor = WarnTextColor;
        _label.numberOfLines = 0;
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (void)makeConstraints{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY).offset(-20);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(50);
    }];
}

- (void)setTitleText:(NSString *)title{
    self.title = title;
    self.label.text = title;
}





@end
