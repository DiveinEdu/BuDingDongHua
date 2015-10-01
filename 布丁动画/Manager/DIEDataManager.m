//
//  DIEDataManager.m
//  布丁动画
//
//  Created by apple on 15/9/28.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIEDataManager.h"
#import "DIENetworkManager.h"

#import "DIECategoryModel.h"
#import "DIEAnimeModel.h"
#import "DIEEpisodeModel.h"

#import "DIENotificationConfig.h"

@interface DIEDataManager ()
{
    NSMutableArray *_categoryArray;
    
    NSInteger _categoryOffset;
    NSInteger _categoryLimit;
}
@end

@implementation DIEDataManager
+ (instancetype)sharedManager {
    static DIEDataManager *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DIEDataManager alloc] init];
    });
    
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _categoryArray = [NSMutableArray array];
        _categoryLimit = 24;
    }
    
    return self;
}

- (id)parseData:(id)data withModel:(Class)class{
    if ([data isKindOfClass:[NSArray class]]) {
        //转换整个JSON数组
        return [class modelsFromJSONArray:data];
    }
    else {
        return [class modelFromJSONDictionary:data];
    }
}

- (NSArray *)categoryArray {
    return [_categoryArray copy];
}

- (void)updateCategory {
    [DIENetworkManager categoryWithOffset:_categoryOffset limit:_categoryLimit completion:^(id responseObject, DIEError *error) {
        NSArray *array = [self parseData:responseObject withModel:[DIECategoryModel class]];
        [_categoryArray removeAllObjects];
        [_categoryArray addObjectsFromArray:array];
        
        DIEPost(kDIECategoryUpdateNotif, nil, nil);
    }];
}

- (void)categoryDetailWithId:(NSString *)categoryId {
    [DIENetworkManager categoryDetailWithId:categoryId limit:24 completion:^(id responseObject, DIEError *error) {
        NSArray *array = [self parseData:responseObject withModel:[DIEAnimeModel class]];
        DIEPost(kDIECategoryDetailNotif, nil, @{kDIENotificationUserInfo:array});
    }];
}

- (void)currentAnimeWithId:(NSString *)animeId {
    [DIENetworkManager animeWithId:animeId completion:^(id responseObject, DIEError *error) {
        DIEAnimeModel *anime = [self parseData:responseObject withModel:[DIEAnimeModel class]];
        DIEPost(kDIEUserAnimeNotif, nil, @{kDIENotificationUserInfo:anime});
    }];
}

- (void)episodeWithAnimeId:(NSString *)animeId index:(NSInteger)index {
    [DIENetworkManager episodeWithAnimeId:animeId index:index completion:^(id responseObject, DIEError *error) {
        DIEEpisodeModel *episode = [self parseData:responseObject withModel:[DIEEpisodeModel class]];
        DIEPost(kDIEEpisodeNotif, nil, @{kDIENotificationUserInfo:episode});
    }];
}

- (void)sectionsWithVideoId:(NSString *)videoId quality:(NSInteger)quality {
    [DIENetworkManager sectionsWithVideoId:videoId quality:quality completion:^(id responseObject, DIEError *error) {
        
    }];
}
@end
