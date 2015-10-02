//
//  DIEEpisodeViewController.m
//  布丁动画
//
//  Created by apple on 15/9/30.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIEEpisodeViewController.h"
#import "DIEVideoViewController.h"

#import "DIEDataManager.h"
#import "DIEEpisodeModel.h"
#import "DIEVideoModel.h"

#import "DIENotificationConfig.h"

@interface DIEEpisodeViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    
    DIEEpisodeModel *_episode;
}
@end

@implementation DIEEpisodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    DIEAddObserver(self, @selector(didUpdate:), kDIEEpisodeNotif, nil);
    
    [[DIEDataManager sharedManager] episodeWithAnimeId:_anime.animeId index:_currentEpisode];
}

- (void)didUpdate:(NSNotification *)notification {
    _episode = notification.userInfo[kDIENotificationUserInfo];
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _episode.videos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    DIEVideoModel *video = _episode.videos[indexPath.row];
    cell.textLabel.text = video.sourceWording;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DIEVideoModel *video = _episode.videos[indexPath.row];
    NSLog(@"%@", video.sourceWording);
    
    DIEVideoViewController *videoCtrl = [[DIEVideoViewController alloc] init];
    videoCtrl.video = video;
    [self.navigationController pushViewController:videoCtrl animated:YES];
}

- (void)dealloc {
    DIERemoveObserver(self, kDIEEpisodeNotif, nil);
}

@end
