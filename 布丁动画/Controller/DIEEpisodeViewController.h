//
//  DIEEpisodeViewController.h
//  布丁动画
//
//  Created by apple on 15/9/30.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DIEAnimeModel.h"

@interface DIEEpisodeViewController : UIViewController

@property (nonatomic, strong) DIEAnimeModel *anime;
@property (nonatomic, assign) NSInteger currentEpisode;
@end
