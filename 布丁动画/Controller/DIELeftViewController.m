//
//  DIELeftViewController.m
//  布丁动画
//
//  Created by apple on 15/9/20.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIELeftViewController.h"
#import "DIELeftTableViewCell.h"

@interface DIELeftViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_imageArray;
    NSArray *_titleArray;
}
@end

@implementation DIELeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageArray = @[@"side_menu_icon_history",
                    @"side_menu_icon_cache",
                    @"side_menu_icon_statistics",
                    @"side_menu_icon_promotor",
                    @"side_menu_icon_setting",
                    @"side_menu_icon_notification"];
    
    _titleArray = @[@"追番记录",
                    @"离线缓存",
                    @"布丁统计",
                    @"布丁娘送周边",
                    @"设置",
                    @"通知"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //1. 背景视图
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"side_menu_bg.jpg"]];
    //4. 禁止滚动
    tableView.scrollEnabled = NO;
    
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[DIELeftTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //2. 设置UITableView的头部
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 215)];
    tableView.tableHeaderView = headerView;
    
    //3. 消除尾部多余的分割线
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DIELeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    cell.textLabel.text = _titleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //取消选择
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
