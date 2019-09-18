//
//  RHUserInfoModel.h
//  RHBaseProject
//
//  Created by 🐷 🐷 on 2018/7/27.
//  Copyright © 2018年 🐷 🐷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHUserInfoModel : NSObject

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString * userName;

@property (nonatomic, copy) NSString * phone;

@property (nonatomic, copy) NSString * email;

@property (nonatomic, assign) LoginType loginType;

@property (nonatomic, assign) UserRole userRole;

@property (nonatomic, copy) NSString * birthday;

@property (nonatomic, copy) NSString * imageUrl;

@property (nonatomic, copy) NSString * createDate;

@property (nonatomic, copy) NSString * updateDate;

@end
