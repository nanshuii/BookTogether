//
//  RHHomeCell.m
//  BookTogether
//
//  Created by 南水 on 2018/9/11.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import "RHHomeCell.h"
#import "RHHome.h"

@interface RHHomeCell() {
    NSInteger _tagsCount;
}

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@property (weak, nonatomic) IBOutlet UILabel *tagLabel1;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel2;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel3;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end

@implementation RHHomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.tagLabel2.hidden = YES;
    self.tagLabel3.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bindDataWithModel:(id)model{
    RHHome *info = model;
    self.nameLabel.text = info.name;
    self.moneyLabel.text = [NSString stringWithFormat:@"%.2f", info.money];
    self.timeLabel.text = info.createTime;
    // money
    if (info.money >= 0) {
        self.moneyLabel.textColor = DefaultTextColor;
    } else {
        self.moneyLabel.textColor = OrangeTextColor;
    }
    // tags
    _tagsCount = info.tags.count;
    if (_tagsCount == 0) {
        return;
    }
    
    NSString *tag = [NSString stringWithFormat:@"[%@]", info.tags[0]];
    self.tagLabel1.text = tag;
    
    if (_tagsCount > 2) {
        self.tagLabel3.hidden = NO;
        NSString *tag = [NSString stringWithFormat:@"[%@]", info.tags[2]];
        self.tagLabel3.text = tag;
    }
    if (_tagsCount > 1) {
        self.tagLabel2.hidden = NO;
        NSString *tag = [NSString stringWithFormat:@"[%@]", info.tags[1]];
        self.tagLabel2.text = tag;
    }
}


@end
