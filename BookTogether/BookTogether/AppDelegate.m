//
//  AppDelegate.m
//  BookTogether
//
//  Created by 南水 on 2018/9/10.
//  Copyright © 2018年 林南水. All rights reserved.
//

#import "AppDelegate.h"
#import "RHMyViewController.h"
#import "RHFamilyViewController.h"
#import "RHHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setHome];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

# pragma mark -- 设置主页
- (void)setHome{
    RHHomeViewController *homeVC = [RHHomeViewController new];
    RHFamilyViewController *familyVC = [RHFamilyViewController new];
    RHMyViewController *myVC = [RHMyViewController new];
    
    UITabBarController *tab = [UITabBarController new];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"主页" image:IMAGE(@"home") tag:0];
    UINavigationController *familyNav = [[UINavigationController alloc] initWithRootViewController:familyVC];
    familyNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"家庭" image:IMAGE(@"family") tag:1];
    UINavigationController *myNav = [[UINavigationController alloc] initWithRootViewController:myVC];
    myNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"个人中心" image:IMAGE(@"my") tag:2];
    [tab setViewControllers:@[homeNav, familyNav, myNav]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
}


@end
