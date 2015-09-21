//
//  AppDelegate.m
//  布丁动画
//
//  Created by apple on 15/9/20.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"

#import "DIELeftViewController.h"
#import "DIECenterViewController.h"
#import "DIETimeLineViewController.h"
#import "DIEThirdViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (NSArray *)tabBarControllers {
    DIECenterViewController *centerCtrl = [[DIECenterViewController alloc] init];
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:centerCtrl];
    
    DIETimeLineViewController *timeLineCtrl = [[DIETimeLineViewController alloc] init];
    
    DIEThirdViewController *thirdCtrl = [[DIEThirdViewController alloc] init];
    
    return @[navCtrl, timeLineCtrl, thirdCtrl];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    

    UITabBarController *tabBarCtrl = [[UITabBarController alloc] init];
    tabBarCtrl.viewControllers = [self tabBarControllers];
    
    DIELeftViewController *leftCtrl = [[DIELeftViewController alloc] init];
    MMDrawerController *drawerCtrl = [[MMDrawerController alloc] initWithCenterViewController:tabBarCtrl leftDrawerViewController:leftCtrl];
    
    //支持打开抽屉的手势类型
    drawerCtrl.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    //支持关闭抽屉的手势类型
    drawerCtrl.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;

    self.window.rootViewController = drawerCtrl;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
