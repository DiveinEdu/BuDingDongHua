//
//  DIEToolkit.h
//  布丁动画
//
//  Created by apple on 15/9/25.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "DIEApiConfig.h"

#define kDIEIsIPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define kDIEIsIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kDIEIsRetina ([[UIScreen mainScreen] scale] >= 2.0)

#define kDIEScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define kDIEScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define kDIEScreenMaxLength (MAX(kDIEScreenWidth, kDIEScreenHeight))
#define kDIEScreenMinLength (MIN(kDIEScreenWidth, kDIEScreenHeight))

#define kDIEIsIPhone4SOrLess (kDIEIsIPhone && kDIEScreenMaxLength < 568.0)
#define kDIEIsIPhone5 (kDIEIsIPhone && kDIEScreenMaxLength == 568.0)
#define kDIEIsIPhone6 (kDIEIsIPhone && kDIEScreenMaxLength == 667.0)
#define kDIEIsIPhone6P (kDIEIsIPhone && kDIEScreenMaxLength == 736.0)

@interface DIEToolkit : NSObject

/// 获取设备相关参数
+ (NSDictionary *)deviceParams;

/// 获取App相关参数
+ (NSDictionary *)appParams;

/// 获取完整的参数
+ (NSDictionary *)fullParams:(NSDictionary *)params;

/// 动画分类接口
+ (NSString *)categoryApi;

/// 分类详情接口
+ (NSString *)categoryDetailApiWithId:(NSString *)categoryId;

/// 动画详情接口
+ (NSString *)userAnimeApiWithId:(NSString *)animeId;

/// 单集详情接口
+ (NSString *)episodeApiWithAnimeId:(NSString *)animeId index:(NSInteger)index;

/**
 * @brief 单集资源列表（来源）
 * @param videoId 视频资源Id
 * @return 获取视频资源的完整路径
 */
+ (NSString *)videoApiWithVideoId:(NSString *)videoId;

@end
