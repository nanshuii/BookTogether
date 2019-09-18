//
//  RHUtility+UserInfo.m
//  RHBaseProject
//
//  Created by 🐷 🐷 on 2018/7/27.
//  Copyright © 2018年 🐷 🐷. All rights reserved.
//

#import "RHUtility+UserInfo.h"

@implementation RHUtility (UserInfo)

# pragma mark -- save
+ (void)saveUserInfo:(RHUserInfoModel *)userInfo{
    [UserDefaults setObject:userInfo.userId forKey:rUserId];
    [UserDefaults setObject:userInfo.userName forKey:rUserName];
    [UserDefaults setObject:userInfo.imageUrl forKey:rUserImage];
    [UserDefaults setObject:userInfo.phone forKey:rUserPhone];
    [UserDefaults setObject:userInfo.email forKey:rUserEmail];
    [UserDefaults setObject:@(userInfo.loginType) forKey:rUserLoginType];
    [UserDefaults setObject:@(userInfo.userRole) forKey:rUserRole];
    [UserDefaults setObject:userInfo.birthday forKey:rUserBirthday];
    [UserDefaults setObject:userInfo.createDate forKey:rUserCreateDate];
    [UserDefaults synchronize];
}

+ (void)saveUserId:(NSString *)userId{
    [UserDefaults setObject:userId forKey:rUserId];
    [UserDefaults synchronize];
}

+ (void)saveUserName:(NSString *)userName{
    [UserDefaults setObject:userName forKey:rUserName];
    [UserDefaults synchronize];
}

+ (void)saveUserRole:(UserRole)userRole{
    [UserDefaults setObject:@(userRole) forKey:rUserRole];
    [UserDefaults synchronize];
}

+ (void)saveUserLoginType:(LoginType)userLoginType{
    [UserDefaults setObject:@(userLoginType) forKey:rUserLoginType];
    [UserDefaults synchronize];
}

+ (void)saveUserImage:(NSString *)userImage{
    [UserDefaults setObject:userImage forKey:rUserImage];
    [UserDefaults synchronize];
}

+ (void)saveUserPhone:(NSString *)userPhone{
    [UserDefaults setObject:userPhone forKey:rUserPhone];
    [UserDefaults synchronize];
}

+ (void)saveUserEmail:(NSString *)userEmail{
    [UserDefaults setObject:userEmail forKey:rUserEmail];
    [UserDefaults synchronize];
}

+ (NSString *)getUserId{
    return [UserDefaults objectForKey:rUserId];
}

+ (NSString *)getUserName{
    return [UserDefaults objectForKey:rUserName];
}

+ (NSString *)getUserEmail{
    return [UserDefaults objectForKey:rUserEmail];
}

+ (NSString *)getUserPhone{
    return [UserDefaults objectForKey:rUserPhone];
}

+ (LoginType)getUserLoginType{
    return [[UserDefaults objectForKey:rUserLoginType] unsignedIntegerValue];
}

+ (UserRole)getUserRole{
    return [[UserDefaults objectForKey:rUserRole] unsignedIntegerValue];
}
























@end
