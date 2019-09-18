//
//  RHEnumHeader.h
//  RHBaseProject
//
//  Created by 🐷 🐷 on 2018/7/27.
//  Copyright © 2018年 🐷 🐷. All rights reserved.
//

#ifndef RHEnumHeader_h
#define RHEnumHeader_h
#import <Foundation/Foundation.h>
# pragma mark -- 登录方式
typedef enum : NSUInteger {
    LoginTypeByPhone,
    LoginTypeByEmail,
} LoginType;

# pragma mark -- 用户角色
typedef enum : NSUInteger {
    UserRoleOne,
    UserRoleTwo,
    UserRoleThree,
} UserRole;






#endif /* RHEnumHeader_h */
