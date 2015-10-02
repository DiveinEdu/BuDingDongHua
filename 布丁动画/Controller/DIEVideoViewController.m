//
//  DIEVideoViewController.m
//  布丁动画
//
//  Created by apple on 15/10/1.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIEVideoViewController.h"

#import "DIEDataManager.h"
#import "DIESectionModel.h"

#import "DIENotificationConfig.h"

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface DIEVideoViewController ()
{
    NSArray *_qualityArray;
    NSArray *_sectionArray;
    
    AVPlayerLayer *_playerLayer;
}
@end

@implementation DIEVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSURL *url = [NSURL fileURLWithPath:@"/Users/apple/Desktop/zhaoritian.mp4"];
    //创建播放本地视频的播放器对象
    AVPlayer *player = [AVPlayer playerWithURL:url];
    //使用播放器对象创建用于显示的AVPlayerLayer
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    _playerLayer.frame = self.view.bounds;
    //显示AVPlayerLayer
    [self.view.layer addSublayer:_playerLayer];
    
//    [player addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:NULL];
    
    //设置播放速率
//    player.rate = 2.0;
    //播放视频
    [player play];
//    //暂停视频播放
//    [player pause];
//    //获取当前播放的时间
//    NSLog(@"%f", CMTimeGetSeconds(player.currentTime));
////    当前在第1000帧，每秒24帧
    CMTime t = CMTimeMake(2, 2);
//    //当前在第60秒，每秒24帧
//    CMTime t = CMTimeMakeWithSeconds(1, 1);
//    //移动播放位置
//    [player seekToTime:t];
//    
//    //获取当前视频的总时长
//    CMTime duration = player.currentItem.duration;
//    //音量，但是一般用MPVolumeView来控制
//    player.volume = 1.0f;
//    //静音
//    player.muted = YES;
    
    [player addPeriodicTimeObserverForInterval:t queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"%lld", time.value / time.timescale);
    }];
    
    DIEAddObserver(self, @selector(didUpdate:), kDIEVideoNotif, nil);
    
    //默认选最好的质量
    [[DIEDataManager sharedManager] sectionsWithVideoId:_video.videoId quality:3];
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
//    NSLog(@"%@", change);
//}

- (void)didUpdate:(NSNotification *)notification {
    DIEVideoModel *video = notification.userInfo[kDIENotificationUserInfo];
    //合并新数据
    [_video mergeValuesForKeysFromModel:video];
    
    DIESectionModel *section = _video.sections.firstObject;

}

- (void)dealloc {
    DIERemoveObserver(self, kDIEVideoNotif, nil);
}
@end
