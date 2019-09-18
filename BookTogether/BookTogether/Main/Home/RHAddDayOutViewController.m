//
//  RHAddDayOutViewController.m
//  BookTogether
//
//  Created by 狗子头林冲 on 2018/9/16.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import "RHAddDayOutViewController.h"
#import "RHAmountTag.h"

@interface RHAddDayOutViewController () {
    BOOL _isOut; // 判定现在的情况是支出还是收入
    BOOL _tagSelected; // 是否已经选择过标签
}

@property (weak, nonatomic) IBOutlet UIButton *moneyType;
@property (weak, nonatomic) IBOutlet UITextField *moneyValue;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIButton *tag;
@property (weak, nonatomic) IBOutlet UITextView *remark;


@end

@implementation RHAddDayOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getTags];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpUI{
    NSString *title = @"添加";
    if (self.type == 0) {
        title = @"编辑";
    }
    self.title = title;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:(UIBarButtonItemStyleDone) target:self action:@selector(save)];
    [self.navigationItem setRightBarButtonItem:rightItem];
    
    _tagSelected = NO;
    if (self.type == 0) {
        // 编辑
        float money = self.model.money;
        if (money > 0) {
            // 收入
            _isOut = NO;
            [self.moneyType setTitle:@"收入" forState:(UIControlStateNormal)];
        } else {
            // 支出
            _isOut = YES;
            // 把负号去掉
            money = (-1) * money;
        }
        self.moneyValue.text = [NSString stringWithFormat:@"%.2f", money];
        self.name.text = self.model.name;
        NSString *tag = self.model.tags[0]; // 现在就取第一个标签
        [self.tag setTitle:tag forState:(UIControlStateNormal)];
        _tagSelected = YES;
        if (self.model.remark == nil || [self.model.remark isEqualToString:@""]) {
            // 备注是空的
            self.remark.text = @"";
        } else {
            self.remark.text = self.model.remark;
        }
    } else {
        // 新增
        _isOut = YES;
    }
}

# pragma mark -- 读取标签列表
- (void)getTags{
    RHAmountTag *tag1 = [RHAmountTag new];
    tag1.name = @"tag1";
    [self.sources addObject:tag1];
    RHAmountTag *tag2 = [RHAmountTag new];
    tag2.name = @"tag2";
    [self.sources addObject:tag2];
    RHAmountTag *tag3 = [RHAmountTag new];
    tag3.name = @"tag3";
    [self.sources addObject:tag3];
    
    [self initTags];
}

- (void)initTags{
    if (self.type == 1) {
        RHAmountTag *tag = self.sources[0];
        [self.tag setTitle:tag.name forState:(UIControlStateNormal)];
        _tagSelected = YES;
    }
}

# pragma mark -- 改变类型为支出或收入
- (IBAction)moneyTypeAction:(UIButton *)sender {
    if (_isOut) {
        [self.moneyType setTitle:@"收入" forState:(UIControlStateNormal)];
        _isOut = NO;
        if ([self.name.text isEqualToString:@"支出"]) {
            self.name.text = @"收入";
        }
    } else {
        [self.moneyType setTitle:@"支出" forState:(UIControlStateNormal)];
        _isOut = YES;
        if ([self.name.text isEqualToString:@"收入"]) {
            self.name.text = @"支出";
        }
    }
}

# pragma mark -- 标签选择
- (IBAction)tagAction:(UIButton *)sender {
    // 出现标签列表
    if (self.sources == 0) {
        // 表示没获取到标签, 需要重新读取标签
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
        for (RHAmountTag *tag in self.sources) {
            WEAKSELF(weakSelf);
            [alert addAction:[UIAlertAction actionWithTitle:tag.name style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                RHLog(@"点击了tag = %@", tag.name);
                [weakSelf.tag setTitle:tag.name forState:(UIControlStateNormal)];
            }]];
        }
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    RHLog(@"did change selection");
}


# pragma mark -- 保存
- (void)save{
    RHLog(@"保存");
    if (_tagSelected == NO) {
        RHLog(@"没有选择标签");
        return;
    }
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
