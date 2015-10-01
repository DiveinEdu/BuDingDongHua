//
//  DIENetworkManager.h
//  布丁动画
//
//  Created by apple on 15/9/29.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DIEError.h"

/**
 * @brief 网络请求完成回调类型
 * @param responseObject 解析过的JSON数据
 * @param error 封装后的错误信息
 */
typedef void(^CompletionType)(id responseObject, DIEError *error);

@interface DIENetworkManager : NSObject

/**
 * @brief 根据偏移量和获取一定数目的分类消息
 * @param offset 偏移量，按分类个数计算
 * @param limit 一次最多获取多少个分类
 * @param completion 请求完成后的回调<strong>void(^)(id responseObject, DIEError *error)</strong>
 */
+ (void)categoryWithOffset:(NSInteger)offset limit:(NSInteger)limit completion:(CompletionType)completion;

/**
 * @brief 根据分类Id获取这个分类下的动画信息，可以限制个数
 * @param categoryId 分类Id
 * @param limit 需要获取的动画数目
 * @param completion 请求完成后的回调<strong>void(^)(id responseObject, DIEError *error)</strong>
 */
+ (void)categoryDetailWithId:(NSString *)categoryId limit:(NSInteger)limit completion:(CompletionType)completion;

/**
 * @brief 根据动画Id获取动画片的详细信息
 * @param animeId 动画Id
 * @param completion 请求完成后的回调<strong>void(^)(id responseObject, DIEError *error)</strong>
 */
+ (void)animeWithId:(NSString *)animeId completion:(CompletionType)completion;

/**
 * @brief 根据动画Id获取单集动画的详细信息
 * @param animeId 动画Id
 * @param index 第几集
 * @param completion 请求完成后的回调<strong>void(^)(id responseObject, DIEError *error)</strong>
 */
+ (void)episodeWithAnimeId:(NSString *)animeId index:(NSInteger)index completion:(CompletionType)completion;

/**
 * @brief 根据视频资源的Id和质量获取视频地址信息
 * @param videoId 视频资源Id
 * @param quality 视频质量
 * @param completion 请求完成后的回调<strong>void(^)(id responseObject, DIEError *error)</strong>
 */
+ (void)sectionsWithVideoId:(NSString *)videoId quality:(NSInteger)quality completion:(CompletionType)completion;
@end
