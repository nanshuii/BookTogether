//
//  RHAmount.h
//  BookTogether
//
//  Created by 南水 on 2018/9/17.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHAmount : NSObject

@property (nonatomic, copy) NSString *amountId;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, assign) float planMoney;
@property (nonatomic, assign) float outMoney;
@property (nonatomic, assign) NSInteger type; // 0:月；1：日



@end
