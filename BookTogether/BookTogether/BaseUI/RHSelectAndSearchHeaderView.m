//
//  RHSelectAndSearchHeaderView.m
//  BookTogether
//
//  Created by 南水 on 2018/9/11.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import "RHSelectAndSearchHeaderView.h"

@interface RHSelectAndSearchHeaderView()


@property (nonatomic, copy) NSArray *selects;
@property (nonatomic, strong) UIScrollView *scrollView;


@property (nonatomic, assign) BOOL search;
@property (nonatomic, assign) CGFloat searchWidth;
@property (nonatomic, strong) UIView *searchView;
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation RHSelectAndSearchHeaderView

- (instancetype)initWithFrame:(CGRect)frame selects:(NSArray *)selects search:(BOOL)search{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.selects = [NSArray arrayWithArray:selects];
        self.search = search;
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
    if (self.search) {
        self.searchWidth = 58;
        [self addSubview:self.searchView];
        [self searchViewUI];
    } else {
        self.searchWidth = 0;
    }
    [self addSubview:self.scrollView];
    [self scrollViewUI];
}

# pragma mark -- Search
- (UIView *)searchView{
    if (!_searchView) {
        _searchView = [UIView new];
        CGRect frame = CGRectMake(self.frame.size.width - self.searchWidth, 0, self.searchWidth, self.frame.size.height);
        _searchView.frame = frame;
    }
    return _searchView;
}

- (void)searchViewUI{
    UILabel *label = [UILabel new];
    label.text = @"搜索";
    label.font = DefaultFont;
    label.textColor = LightTextColor;
    [self.searchView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.searchView.mas_centerX);
        make.centerY.mas_equalTo(self.searchView.mas_centerY);
    }];
    
    UIView *line = [UIView new];
    CGFloat lineHeight = 16;
    line.backgroundColor = DefaultLineColor;
    [self.searchView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.searchView.mas_left);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(lineHeight);
        make.centerY.mas_equalTo(self.searchView.mas_centerY);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchAction)];
    [self.searchView addGestureRecognizer:tap];
    self.searchView.userInteractionEnabled = YES;
}


- (void)searchAction{
    RHLog(@"点击了搜索");
    if (_searchTag) {
        _searchTag(self.search);
    }
}

# pragma mark -- UIScrollView
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        CGRect frame = CGRectMake(0, 0, self.frame.size.width - self.searchWidth, self.frame.size.height);
        _scrollView.frame = frame;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (void)scrollViewUI{
    // 计算每一个的宽度
    CGFloat swidth = self.frame.size.width - self.searchWidth;
    CGFloat width = 70;
    int count = swidth / width;
    width = swidth / count;
    self.scrollView.contentSize = CGSizeMake(width * self.selects.count, self.frame.size.height);
    
    for (int i = 0; i < self.selects.count; i++) {
        NSString *select = self.selects[i];
        NSString *normalSelect = [NSString stringWithFormat:@"%@ ▼", select];
        NSString *selectedSelect = [NSString stringWithFormat:@"%@ ▲", select];
        UIColor *normalColor = LightTextColor;
        UIColor *selectedColor = [UIColor blueColor];
        UIButton *selectView = [UIButton  new];
        CGRect selectFrame = CGRectMake(width*i, 0, width, self.frame.size.height);
        selectView.frame = selectFrame;
        [selectView setTitle:normalSelect forState:UIControlStateNormal];
        [selectView setTitleColor:normalColor forState:UIControlStateNormal];
        [selectView setTitle:selectedSelect forState:UIControlStateSelected];
        [selectView setTitleColor:selectedColor forState:UIControlStateSelected];
        selectView.titleLabel.font = DefaultFont;
        selectView.tag = 1000 + i;
        [selectView addTarget:self action:@selector(selectItemAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.scrollView addSubview:selectView];
    }
}

- (void)selectItemAction:(UIButton *)sender{
    NSInteger tag = sender.tag - 1000;
    RHLog(@"点击的是哪一个 %li %@", tag, self.selects[tag]);
    sender.selected = !sender.selected;
    if (_selectTag) {
        _selectTag(tag);
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
