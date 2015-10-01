//
//  DIENotificationConfig.h
//  布丁动画
//
//  Created by apple on 15/9/30.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DIEPost(name, obj, info) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj userInfo:info]

#define DIEAddObserver(observer, action, n, obj) [[NSNotificationCenter defaultCenter] addObserver:observer selector:action name:n object:obj]

#define DIERemoveObserver(observer, n, obj) [[NSNotificationCenter defaultCenter] removeObserver:observer name:n object:obj]

/// 通知UserInfo中附带数据的Key
FOUNDATION_EXTERN NSString * const kDIENotificationUserInfo;

/// 分类数据更新通知
FOUNDATION_EXTERN NSString * const kDIECategoryUpdateNotif;
/// 获取更多分类通知
FOUNDATION_EXTERN NSString * const kDIECategryLoadMoreNotif;
/// 分类详情通知
FOUNDATION_EXTERN NSString * const kDIECategoryDetailNotif;
/// 动画详情通知
FOUNDATION_EXTERN NSString * const kDIEUserAnimeNotif;
/// 单集详情通知
FOUNDATION_EXTERN NSString * const kDIEEpisodeNotif;
/// 视频资源详情通知
FOUNDATION_EXTERN NSString * const kDIEVideoNotif;