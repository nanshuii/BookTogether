//
//  RHViewController.m
//  BookTogether
//
//  Created by 南水 on 2018/9/10.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import "RHViewController.h"
#import "RHNoDataView.h"

@interface RHViewController ()

@property (nonatomic, strong) RHNoDataView *noDataView; // 没有数据时候出来的页面



@end

@implementation RHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sources = [NSMutableArray array];
    [self.view addSubview:self.noDataView];
    [self setUpUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark -- UI
// 子类复写
- (void)setUpUI{
    
}

# pragma mark --  点击返回的方法
// 子类复写
- (void)backBtnClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


# pragma mark -- NoDataView
- (RHNoDataView *)noDataView{
    if (!_noDataView) {
        CGRect frame = CGRectMake(0, 0, FullScreenWidth, FullScreenHeight);
        _noDataView = [[RHNoDataView alloc] initWithFrame:frame title:@"没有数据"];
        _noDataView.hidden = YES;
    }
    return _noDataView;
}

- (void)setNoDataViewTitle:(NSString *)title {
    [self.noDataView setTitleText:title];
}

- (void)setNoDataHidden:(BOOL)hidden {
    self.noDataView.hidden = hidden;
}

- (void)setNoDataFrame:(CGRect)frame{
    self.noDataView.frame = frame;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
