//
//  RHHomeViewController.m
//  BookTogether
//
//  Created by 南水 on 2018/9/10.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import "RHHomeViewController.h"
#import "RHHomeCell.h"
#import "RHSelectAndSearchHeaderView.h"
#import "RHHomeHeaderView.h"
#import "RHHomeHandle.h"
#import "RHAddDayOutViewController.h"


@interface RHHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *baseTableView;

@end

@implementation RHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.sources = [RHHomeHandle fakerHomeData];
    [self.baseTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpUI{
//    [self setNoDataHidden:NO];
    self.title = @"主页";
    [self.view addSubview:self.baseTableView];
}



# pragma mark -- UITableView
- (UITableView *)baseTableView{
    if (!_baseTableView) {
        CGRect frame = CGRectMake(0, NavigationBarHeight, FullScreenWidth, FullScreenHeight - NavigationBarHeight - TabbarHeight);
        _baseTableView = [[UITableView alloc] initWithFrame:frame style:(UITableViewStylePlain)];
        _baseTableView.delegate = self;
        _baseTableView.dataSource = self;
//        _baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_baseTableView registerNib:[RHHomeCell nib] forCellReuseIdentifier:[RHHomeCell myClassNameAsCellIdentifier]];
    }
    return _baseTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RHHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:[RHHomeCell myClassNameAsCellIdentifier]];
    [cell bindDataWithModel:self.sources[indexPath.row]];
    CGRect frame = cell.frame;
    frame.size.height = [cell cellHeight];
    cell.frame = frame;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    RHSelectAndSearchHeaderView *header = [[RHSelectAndSearchHeaderView alloc] initWithFrame:CGRectMake(0, 0, FullScreenWidth, 40) selects:@[@"筛选", @"筛选"] search:YES];
//    [header showTopLine:YES bottomLine:NO];
    [view addSubview:header];
    RHHomeHeaderView *header2 = [[RHHomeHeaderView alloc] initWithFrame:CGRectMake(0, 40, FullScreenWidth, 100) model:nil];
    [header2 showTopLine:YES bottomLine:YES];
    [view addSubview:header2];
    WEAKSELF(weakSelf);
    [header2 setMonths:^(int currentMonth) {
        [weakSelf toMonths];
    }];
    [header2 setAddDayOut:^(int currentDay) {
        [weakSelf addDayOut];
    }];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 140;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self tableView:tableView willDeselectRowAtIndexPath:indexPath];
    RHLog(@"row = %li", indexPath.row);
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sources.count > 0) {
        return YES;
    }
    return NO;
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleDestructive) title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self deleteDayOut:indexPath.row];
    }];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleNormal) title:@"编辑" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self editDayOut:indexPath.row];
    }];
    return @[action1, action2];
}

# pragma mark -- 新建日支出
- (void)addDayOut{
    RHLog(@"新建日支出");
    RHAddDayOutViewController *vc = [RHAddDayOutViewController new];
    vc.model = [RHHome new];
    vc.type = 1;
    [self.navigationController pushViewController:vc animated:YES];
}

# pragma mark -- 删除日支出
- (void)deleteDayOut:(NSInteger)row{
    RHLog(@"删除日支出 %li", row);
}

# pragma mark -- 编辑日支出
- (void)editDayOut:(NSInteger)row{
    RHLog(@"编辑日支出 %li", row);
    RHAddDayOutViewController *vc = [RHAddDayOutViewController new];
    vc.model = self.sources[row];
    vc.type = 0;
    [self.navigationController pushViewController:vc animated:YES];
}

# pragma mark -- 前往月账单
- (void)toMonths{
    RHLog(@"前往月账单");
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
