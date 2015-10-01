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

FOUNDATION_EXTERN NSString * const kDIENotificationUserInfo;

FOUNDATION_EXTERN NSString * const kDIECategoryUpdateNotif;
FOUNDATION_EXTERN NSString * const kDIECategoryDetailNotif;
FOUNDATION_EXTERN NSString * const kDIEUserAnimeNotif;
FOUNDATION_EXTERN NSString * const kDIEEpisodeNotif;