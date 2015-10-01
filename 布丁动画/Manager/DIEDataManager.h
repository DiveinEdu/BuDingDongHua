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

- (void)updateCategory;
- (void)categoryDetailWithId:(NSString *)categoryId;
- (void)currentAnimeWithId:(NSString *)animeId;
- (void)episodeWithAnimeId:(NSString *)animeId index:(NSInteger)index;
- (void)sectionsWithVideoId:(NSString *)videoId quality:(NSInteger)quality;
@end
