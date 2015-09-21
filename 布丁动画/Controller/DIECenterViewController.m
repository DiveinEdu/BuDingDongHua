//
//  DIECenterViewController.m
//  布丁动画
//
//  Created by apple on 15/9/20.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIECenterViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface DIECenterViewController ()

@end

@implementation DIECenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:self action:@selector(didClicked)];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
