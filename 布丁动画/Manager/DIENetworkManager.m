//
//  DIENetworkManager.m
//  布丁动画
//
//  Created by apple on 15/9/29.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIENetworkManager.h"

#import "DIEToolkit.h"
#import "DIEError.h"

#import "AFNetworking.h"

@implementation DIENetworkManager
+ (void)categoryWithOffset:(NSInteger)offset limit:(NSInteger)limit completion:(CompletionType)completion {
    NSDictionary *params = [DIEToolkit fullParams:@{
                                @"offset":@(offset),
                                @"limit":@(limit)
                           }];
    
    [[AFHTTPSessionManager manager] GET:[DIEToolkit categoryApi] parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        DIEError *err = [[DIEError alloc] initWithError:error];
        completion(nil, err);
    }];
}

+ (void)categoryDetailWithId:(NSString *)categoryId limit:(NSInteger)limit completion:(CompletionType)completion {
    NSDictionary *params = [DIEToolkit fullParams:@{
                                @"limit":@(limit),
                            }];
    [[AFHTTPSessionManager manager] GET:[DIEToolkit categoryDetailApiWithId:categoryId] parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        DIEError *err = [[DIEError alloc] initWithError:error];
        completion(nil, err);
    }];
}

+ (void)animeWithId:(NSString *)animeId completion:(CompletionType)completion {
    NSDictionary *params = [DIEToolkit fullParams:nil];
    [[AFHTTPSessionManager manager] GET:[DIEToolkit userAnimeApiWithId:animeId] parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        DIEError *err = [[DIEError alloc] initWithError:error];
        completion(nil, err);
    }];
}

+ (void)episodeWithAnimeId:(NSString *)animeId index:(NSInteger)index completion:(CompletionType)completion {
    
    NSString *path = [DIEToolkit episodeApiWithAnimeId:animeId index:index];
    NSDictionary *params = [DIEToolkit fullParams:nil];
    [[AFHTTPSessionManager manager] GET:path parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        DIEError *err = [[DIEError alloc] initWithError:error];
        completion(nil, err);
    }];
}
@end
