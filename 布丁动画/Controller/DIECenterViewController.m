//
//  DIECenterViewController.m
//  布丁动画
//
//  Created by apple on 15/9/24.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIECenterViewController.h"

#import "DIERecommendViewController.h"
#import "DIECategoryViewController.h"

#import "MMDrawerController.h"
#import "UIViewController+MMDrawerController.h"
//#import "AppDelegate.h"

@interface DIECenterViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
{
    NSArray *_pageArray;
    
    UIScrollView *_scrollView;
}
@end

@implementation DIECenterViewController

- (instancetype)init {
    if (self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil]) {
        
    }
    
    return self;
}

- (NSArray *)pageControllers {
    DIERecommendViewController *recommendCtrl = [DIERecommendViewController new];
    DIECategoryViewController *categoryCtrl = [DIECategoryViewController new];
    
    return @[recommendCtrl, categoryCtrl];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pageArray = [self pageControllers];
    [self setViewControllers:@[_pageArray[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.dataSource = self;
    self.delegate = self;
    
    _scrollView = [self scrollView:self.view];
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];
    
//    //在内存中查找不能直接获取到的对象
//    //1. 从内到外的获取leftController
//    NSLog(@"%@", self.navigationController.tabBarController.mm_drawerController.leftDrawerViewController);
    
//    //2. 从外到内的获取centerController
//    //2.1 获取window
////    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    //2.2 获取window
//    UIWindow *window = ((AppDelegate *)[UIApplication sharedApplication].delegate).window;
//    MMDrawerController *drawerCtrl = (MMDrawerController *)window.rootViewController;
//    UITabBarController *tabBarCtrl = (UITabBarController *)drawerCtrl.centerViewController;
//    UINavigationController *navCtrl = (UINavigationController *)tabBarCtrl.viewControllers.firstObject;
//    NSLog(@"%@", navCtrl.viewControllers.firstObject);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSValue *value = change[NSKeyValueChangeNewKey];
    CGPoint point = value.CGPointValue;
    
    if (_currentPage == 0 && point.x <= self.view.frame.size.width) {
        _scrollView.panGestureRecognizer.enabled = NO;
        _scrollView.panGestureRecognizer.enabled = YES;
    }
    else {
        MMDrawerController *drawerCtrl = (MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        drawerCtrl.panGestureRecognizer.enabled = NO;
        drawerCtrl.panGestureRecognizer.enabled = YES;
    }
}

//查找scrollView
- (UIScrollView *)scrollView:(UIView *)view {
    for (UIView *v in view.subviews) {
        if ([v isKindOfClass:[UIScrollView class]]) {
            return (UIScrollView *)v;
        }
        else {
            UIView *sv = [self scrollView:v];
            if (sv) {
                return (UIScrollView *)sv;
            }
        }
    }
    
    return nil;
}

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    
    UIPageViewControllerNavigationDirection direction;
    if (_currentPage) {
        direction = UIPageViewControllerNavigationDirectionForward;
    }
    else {
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    
    [self setViewControllers:@[_pageArray[_currentPage]] direction:direction animated:YES completion:nil];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (_currentPage) {
        return _pageArray[0];
    }
    else {
        return nil;
    }
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (_currentPage) {
        return nil;
    }
    else {
        return _pageArray[1];
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    _currentPage = [_pageArray indexOfObject:pageViewController.viewControllers.firstObject];
}

- (void)dealloc {
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}
@end
