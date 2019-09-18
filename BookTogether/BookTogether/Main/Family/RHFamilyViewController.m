//
//  RHFamilyViewController.m
//  BookTogether
//
//  Created by 南水 on 2018/9/17.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import "RHFamilyViewController.h"
#import "RHFamilyCell.h"

@interface RHFamilyViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISegmentedControl *dateSegmentControl;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@property (weak, nonatomic) IBOutlet UIView *tableContentView;

@property (nonatomic, strong) UITableView *baseTableView;

@end

@implementation RHFamilyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpUI{
    self.title = @"家庭";
    [self.tableContentView addSubview:self.baseTableView];
}


# pragma mark -- UITableView
- (UITableView *)baseTableView{
    if (!_baseTableView) {
        CGRect frame = self.tableContentView.frame;
        _baseTableView = [[UITableView alloc] initWithFrame:frame style:(UITableViewStylePlain)];
        _baseTableView.delegate = self;
        _baseTableView.dataSource = self;
        //        _baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_baseTableView registerNib:[RHFamilyCell nib] forCellReuseIdentifier:[RHFamilyCell myClassNameAsCellIdentifier]];
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
    RHFamilyCell *cell = [tableView dequeueReusableCellWithIdentifier:[RHFamilyCell myClassNameAsCellIdentifier]];
    [cell bindDataWithModel:self.sources[indexPath.row]];
    return cell;
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
