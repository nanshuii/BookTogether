//
//  RHAddDayOutViewController.h
//  BookTogether
//
//  Created by 狗子头林冲 on 2018/9/16.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import "RHViewController.h"
#import "RHHome.h"

@interface RHAddDayOutViewController : RHViewController

@property (nonatomic, strong) RHHome *model;

// 0:edit;1:add;
@property (nonatomic, assign) NSInteger type;


@end
