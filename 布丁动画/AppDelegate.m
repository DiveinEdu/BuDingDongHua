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

#import "DIERecommendViewController.h"
#import "DIECategoryViewController.h"

#import "ViewPagerController.h"

@interface AppDelegate ()
{
    MMDrawerController *_drawerCtrl;
    DIECenterViewController *_centerCtrl;
}
@end

@implementation AppDelegate

- (NSArray *)pageViewControllers {
    DIERecommendViewController *recommendCtrl = [[DIERecommendViewController alloc] init];
    DIECategoryViewController *categoryCtrl = [[DIECategoryViewController alloc] init];
    return @[recommendCtrl, categoryCtrl];
}

- (NSArray *)tabBarControllers {
    _centerCtrl = [[DIECenterViewController alloc] init];
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:_centerCtrl];
    
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
    _drawerCtrl = drawerCtrl;
    
    //支持打开抽屉的手势类型
    drawerCtrl.openDrawerGestureModeMask = MMOpenDrawerGestureModePanningCenterView | MMOpenDrawerGestureModePanningNavigationBar;
    //支持关闭抽屉的手势类型
    drawerCtrl.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;

    self.window.rootViewController = drawerCtrl;
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
