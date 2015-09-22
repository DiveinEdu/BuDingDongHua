//
//  DIECenterViewController.m
//  布丁动画
//
//  Created by apple on 15/9/20.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIECenterViewController.h"
#import "UIViewController+MMDrawerController.h"

#import "DIEUserInfoView.h"

@interface DIECenterViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
{
    UIScrollView *_scrollView;
}
@end

@implementation DIECenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:self action:@selector(didClicked)];
    

    
    DIEUserInfoView *infoView = [[DIEUserInfoView alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    infoView.title = @"戴维营教育";
    [self.view addSubview:infoView];
    
    infoView.title = @"中南大学";
    
#if 0
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 2, self.view.bounds.size.height);
    scrollView.pagingEnabled = YES;
    [scrollView.panGestureRecognizer addTarget:self action:@selector(didPan:)];
//    scrollView.panGestureRecognizer.delegate = self;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    _scrollView = scrollView;
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:redView];
#endif
}

- (void)didPan:(UIPanGestureRecognizer *)recognizer {
    CGPoint v = [recognizer velocityInView:_scrollView];
    NSLog(@"%@", NSStringFromCGPoint(v));
    
    CGPoint offset = _scrollView.contentOffset;
    NSLog(@">%@", NSStringFromCGPoint(offset));
    
    if (offset.x > 0) {
        self.mm_drawerController.panGestureRecognizer.enabled = NO;
    }
//    else {
//        self.mm_drawerController.panGestureRecognizer.enabled = YES;
//    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x >= 0) {
        self.mm_drawerController.panGestureRecognizer.enabled = YES;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    self.mm_drawerController.panGestureRecognizer.delegate = self;
}

- (void)didClicked {
    //所有处于MMDrawerController中的视图控制器都有一个mm_drawerController属性
    if (self.mm_drawerController.openSide == MMDrawerSideLeft) {
        //关闭侧边栏
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
    }
    else {
        //打开左侧
        [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
