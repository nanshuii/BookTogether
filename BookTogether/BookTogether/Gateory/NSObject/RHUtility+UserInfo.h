//
//  RHUtility+UserInfo.h
//  RHBaseProject
//
//  Created by 🐷 🐷 on 2018/7/27.
//  Copyright © 2018年 🐷 🐷. All rights reserved.
//

#import "RHUtility.h"
#import "RHUserInfoModel.h"


@interface RHUtility (UserInfo)

/**
 保存用户信息
 */
+ (void)saveUserInfo:(RHUserInfoModel *)userInfo;

/**
 保存用户id
 */
+ (void)saveUserId:(NSString *)userId;

/**
 保存用户头像
 */
+ (void)saveUserImage:(NSString *)userImage;

/**
 保存用户名
 */
+ (void)saveUserName:(NSString *)userName;

/**
 保存用户手机
 */
+ (void)saveUserPhone:(NSString *)userPhone;

/**
 保存用户邮箱
 */
+ (void)saveUserEmail:(NSString *)userEmail;

/**
 保存用户登录方式
 */
+ (void)saveUserLoginType:(LoginType)userLoginType;

/**
 保存用户角色
 */
+ (void)saveUserRole:(UserRole)userRole;

/**
 读取用户id
 */
+ (NSString *)getUserId;

/**
 读取用户名
 */
+ (NSString *)getUserName;

/**
 读取用户手机
 */
+ (NSString *)getUserPhone;

/**
 读取用户邮箱
 */
+ (NSString *)getUserEmail;

/**
 读取用户登录方式
 */
+ (LoginType)getUserLoginType;

/**
 读取用户角色
 */
+ (UserRole)getUserRole;




























@end
