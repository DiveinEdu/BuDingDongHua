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

@interface AppDelegate () <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIGestureRecognizerDelegate>
{
    NSArray *_pageArray;
    
    MMDrawerController *_drawerCtrl;
}
@end

@implementation AppDelegate

- (NSArray *)pageViewControllers {
    DIERecommendViewController *recommendCtrl = [[DIERecommendViewController alloc] init];
    DIECategoryViewController *categoryCtrl = [[DIECategoryViewController alloc] init];
    return @[recommendCtrl, categoryCtrl];
}

- (NSArray *)tabBarControllers {
    _pageArray = [self pageViewControllers];
    
//    UIPageViewController *centerCtrl = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
//    [centerCtrl setViewControllers:@[_pageArray[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
//    centerCtrl.dataSource = self;
//    centerCtrl.delegate = self;
//    
//    for (UIView *v in centerCtrl.view.subviews) {
//        if ([v isKindOfClass:[UIScrollView class]]) {
//            UIScrollView *scrollView = (UIScrollView *)v;
//            [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];
//        }
//    }
    
//    ViewPagerController *centerCtrl = [[ViewPagerController alloc] init];
//    centerCtrl.dataSource = self;
//    centerCtrl.delegate = self;
    
    DIECenterViewController *centerCtrl = [[DIECenterViewController alloc] init];
    
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:centerCtrl];
    
    DIETimeLineViewController *timeLineCtrl = [[DIETimeLineViewController alloc] init];
    
    DIEThirdViewController *thirdCtrl = [[DIEThirdViewController alloc] init];
    
    return @[navCtrl, timeLineCtrl, thirdCtrl];
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
//    
//    UIScrollView *scrollView = (UIScrollView *)object;
//    CGPoint v = [scrollView.panGestureRecognizer velocityInView:scrollView];
//    if (v.x > 0) {
//        scrollView.panGestureRecognizer.enabled = NO;
//        scrollView.panGestureRecognizer.enabled = YES;
//    }
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UITabBarController *tabBarCtrl = [[UITabBarController alloc] init];
    tabBarCtrl.viewControllers = [self tabBarControllers];
    
    DIELeftViewController *leftCtrl = [[DIELeftViewController alloc] init];
    MMDrawerController *drawerCtrl = [[MMDrawerController alloc] initWithCenterViewController:tabBarCtrl leftDrawerViewController:leftCtrl];
    _drawerCtrl = drawerCtrl;
    drawerCtrl.panGestureRecognizer.delegate = self;
    
    //支持打开抽屉的手势类型
    drawerCtrl.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    //支持关闭抽屉的手势类型
    drawerCtrl.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;

    self.window.rootViewController = drawerCtrl;
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [_pageArray indexOfObject:viewController];
    if (index) {
        return _pageArray[0];
    }
    else {
        return nil;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [_pageArray indexOfObject:viewController];
    if (index) {
        return nil;
    }
    else {
        return _pageArray[1];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

//- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
//    return _pageArray.count;
//}
//
//- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
//    label.text = [NSString stringWithFormat:@"%d", index];
//    return label;
//}
//
//- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
//    return _pageArray[index];
//}

@end
