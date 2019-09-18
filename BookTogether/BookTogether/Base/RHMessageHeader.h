//
//  RHMessageHeader.h
//  RHBaseProject
//
//  Created by 🐷 🐷 on 2018/7/27.
//  Copyright © 2018年 🐷 🐷. All rights reserved.
//

#ifndef RHMessageHeader_h
#define RHMessageHeader_h

# pragma mark -- 用户系统
// 登录
#define MLoginFailure       @"登录失败"
#define MLoginInvalid       @"登录失效"
#define MLoginSuccess       @"登录成功"
// 注册
#define MRegisterFailure    @"注册失败"
#define MRegisterSuccess    @"注册成功"
// 忘记密码
#define MForgetFailure      @"忘记密码失败"
#define MForgetSuccess      @"忘记密码成功"
// 用户名
#define MUsernameNone       @"请输入用户名"
#define MUsernameExist      @"用户名已经存在"
#define MUsernameError      @"用户名错误"
// 密码
#define MPasswordNone       @"请输入密码"
#define MPasswordError      @"密码错误"
#define MPasswordSimple     @"密码过于简单"
#define MPasswordLength     @"密码长度不对"
#define MPasswordNotEqual   @"两次输入的密码不一致"
// 验证码
#define MVerificationNone   @"请输入验证码"
#define MVerificationError  @"验证码错误"

# pragma mark -- 网络
#define MNetworkTimeOut @"网络超时"
#define MNetworkNone    @"没有网络"


#endif /* RHMessageHeader_h */
