//
//  DIENetworkManager.h
//  布丁动画
//
//  Created by apple on 15/9/29.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DIEError.h"

typedef void(^CompletionType)(id responseObject, DIEError *error);

@interface DIENetworkManager : NSObject
+ (void)categoryWithOffset:(NSInteger)offset limit:(NSInteger)limit completion:(CompletionType)completion;
+ (void)categoryDetailWithId:(NSString *)categoryId limit:(NSInteger)limit completion:(CompletionType)completion;
+ (void)animeWithId:(NSString *)animeId limit:(NSInteger)limit completion:(CompletionType)completion;
@end
