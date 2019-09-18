//
//  RHDefaultHeader.h
//  RHBaseProject
//
//  Created by 🐷 🐷 on 2018/7/27.
//  Copyright © 2018年 🐷 🐷. All rights reserved.
//

#ifndef RHDefaultHeader_h
#define RHDefaultHeader_h

# pragma mark -- 屏幕宽高
#define FullScreenWidth    ([UIScreen mainScreen].bounds.size.width)
#define FullScreenHeight   ([UIScreen mainScreen].bounds.size.height)

# pragma mark -- 版本号
#define iOS7    ([[[UIDevice currentDevice] systemVersion] floatValue] = 7.0)
#define iOS7UP  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define iOS8    ([[[UIDevice currentDevice] systemVersion] floatValue] = 8.0)
#define iOS8UP  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define iOS9    ([[[UIDevice currentDevice] systemVersion] floatValue] = 9.0)
#define iOS9UP  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define iOS10   ([[[UIDevice currentDevice] systemVersion] floatValue] = 10.0)
#define iOS10UP ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define iOS11   ([[[UIDevice currentDevice] systemVersion] floatValue] = 11.0)
#define iOS11UP ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)
#define iOS12   ([[[UIDevice currentDevice] systemVersion] floatValue] = 12.0)
#define iOS12UP ([[[UIDevice currentDevice] systemVersion] floatValue] >= 12.0)

# pragma mark -- 手机类型
#define iPhone       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define iPhone_5     (iPhone && FullScreenHeight == 568.0)
#define iPhone_6     (iPhone && FullScreenHeight == 667.0)
#define iPhone_6p    (iPhone && FullScreenHeight == 736.0)
#define iPhone_X     (iPhone && FullScreenHeight == 812.0)

# pragma mark -- 导航栏，标签栏，状态栏
#define StatusBarHeight         (iPhone_X ? 44.0 : 20.0)
#define NavigationBarHeight     (iOS11UP ? 44.0 : 24.0)
#define StatusBarHeightAndNavigationBarHeight   (StatusBarHeight) + (NavigationBarHeight)
#define TabbarHeight        (iPhone_X ? 83.0 : 49.0)
#define BottomHeight        (iPhone_X ? 34.0 : 0.0)

# pragma mark -- weakSelf
#define WEAKSELF(weakSelf)  __weak __typeof(&*self)weakSelf = self;

# pragma mark -- 是否支持屏幕右滑返回
#define PopGestureRecognizer(ret)   (self.navigationController.interactivePopGestureRecognizer.enabled = ret)

# pragma mark -- 自定义打印，在debug时打印，发布时不打印
#ifdef DEBUG
#define RHLog(fmt, ...) NSLog((@"[函数名:%s] " " [行号:%d] " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define RHLog(fmt, ...)
#endif

# pragma mark -- AppDelegate
#define APPDELEGATE (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define ShAREAPPLICATION [UIApplication sharedApplication]


# pragma mark -- 图片
#define IMAGE(imageName)    [UIImage imageNamed:imageName]

# pragma mark -- UserDefaults
#define UserDefaults        [NSUserDefaults standardUserDefaults]

#pragma mark -- 颜色转换
//色码转RGB UIColor
#undef UIColorFromHex
#define UIColorFromHex(hexValue) ([UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0x00FF00) >> 8))/255.0 blue:((float)(hexValue & 0x0000FF))/255.0 alpha:1.0])
//附带透明度
#undef UIColorFromHexA
#define UIColorFromHexA(hexValue,a) ([UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0x00FF00) >> 8))/255.0 blue:((float)(hexValue & 0x0000FF))/255.0 alpha:(a)])




#endif /* RHDefaultHeader_h */
