//
//  DIEDetailViewController.m
//  布丁动画
//
//  Created by apple on 15/9/25.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIEDetailViewController.h"
#import "DIEAnimeViewController.h"

#import "DIECategoryDetailCell.h"

#import "DIEDataManager.h"
#import "DIEAnimeModel.h"

#import "DIENotificationConfig.h"

@interface DIEDetailViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    
    NSArray *_animeArray;
}
@end

@implementation DIEDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DIEAddObserver(self, @selector(didUpdateDetail:), kDIECategoryDetailNotif, nil);
    
    [[DIEDataManager sharedManager] categoryDetailWithId:_category.categoryId];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[DIECategoryDetailCell class] forCellReuseIdentifier:@"cell"];
    tableView.backgroundColor = [UIColor clearColor];
//    tableView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
//    tableView.contentSize = CGSizeMake(tableView.contentSize.width - 20, tableView.contentSize.height);
    [self.view addSubview:tableView];
    _tableView = tableView;
}

- (void)didUpdateDetail:(NSNotification *)notification {
    _animeArray = notification.userInfo[kDIENotificationUserInfo];
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _animeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DIECategoryDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    DIEAnimeModel *anime = _animeArray[indexPath.row];
    cell.textLabel.text = anime.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DIEAnimeViewController *animeCtrl = [[DIEAnimeViewController alloc] init];
    animeCtrl.anime = _animeArray[indexPath.row];
    [self.navigationController pushViewController:animeCtrl animated:YES];
}

- (void)dealloc {
    DIERemoveObserver(self, kDIECategoryDetailNotif, nil);
}
@end
