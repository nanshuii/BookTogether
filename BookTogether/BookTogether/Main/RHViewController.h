//
//  RHViewController.h
//  BookTogether
//
//  Created by 南水 on 2018/9/10.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *sources;


# pragma mark --  点击返回的方法
- (void)backBtnClick:(id)sender;

# pragma mark -- UI
- (void)setUpUI;

# pragma mark -- NoDataView
- (void)setNoDataViewTitle:(NSString *)title;

- (void)setNoDataHidden:(BOOL)hidden;

- (void)setNoDataFrame:(CGRect)frame;
@end
