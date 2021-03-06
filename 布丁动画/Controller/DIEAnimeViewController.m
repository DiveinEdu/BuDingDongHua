//
//  DIEAnimeViewController.m
//  布丁动画
//
//  Created by apple on 15/9/30.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIEAnimeViewController.h"
#import "DIEEpisodeViewController.h"

#import "DIEDataManager.h"
#import "DIEEpisodeModel.h"

#import "DIENotificationConfig.h"

@interface DIEAnimeViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    
    NSArray *_episodeArray;
}
@end

@implementation DIEAnimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    DIEAddObserver(self, @selector(didUpdate:), kDIEUserAnimeNotif, nil);
    
    [[DIEDataManager sharedManager] currentAnimeWithId:_anime.animeId];
}

- (void)didUpdate:(NSNotification *)notification {
    DIEAnimeModel *model = notification.userInfo[kDIENotificationUserInfo];
    //合并数据
    _anime.latestWatchedEpNumber = model.latestWatchedEpNumber;
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _anime.onairEpNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row + 1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DIEEpisodeViewController *episodeCtrl = [[DIEEpisodeViewController alloc] init];
    episodeCtrl.anime = _anime;
    episodeCtrl.currentEpisode = indexPath.row + 1;
    [self.navigationController pushViewController:episodeCtrl animated:YES];
}

- (void)dealloc {
    DIERemoveObserver(self, kDIEUserAnimeNotif, nil);
}

@end
