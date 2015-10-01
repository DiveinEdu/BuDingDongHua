//
//  DIEDataManager.h
//  布丁动画
//
//  Created by apple on 15/9/28.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DIEDataManager : NSObject
@property (nonatomic, copy, readonly) NSArray *categoryArray;

+ (instancetype)sharedManager;

/// 更新分类
- (void)updateCategory;

/// 获取更多分类
- (void)loadMoreCategory;

/**
 * @brief 获取分类详情，结果为一个动画列表
 * @param categoryId 需要获取详情的分类Id
 */
- (void)categoryDetailWithId:(NSString *)categoryId;

/**
 * @brief 获取一个动画片的详细信息，比如集数
 * @param animeId 动画片的Id，唯一标识一部动画片
 */
- (void)currentAnimeWithId:(NSString *)animeId;

/**
 * @brief 获取一集动画的详情
 * @param animeId 动画片的Id
 * @param index 第几集（从1开始）
 */
- (void)episodeWithAnimeId:(NSString *)animeId index:(NSInteger)index;

/**
 * @brief 获取一集动画的资源信息，主要是视频URL（比如优酷、土豆等）
 * @param videoId 资源Id，不同网站的Id不同
 * @param quality 视频质量（标准、高清等）
 */
- (void)sectionsWithVideoId:(NSString *)videoId quality:(NSInteger)quality;
@end
