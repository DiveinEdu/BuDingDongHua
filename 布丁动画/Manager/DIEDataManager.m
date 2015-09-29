//
//  DIEDataManager.m
//  布丁动画
//
//  Created by apple on 15/9/28.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIEDataManager.h"
#import "DIECategoryModel.h"

@interface DIEDataManager ()
{
    NSMutableArray *_categoryArray;
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
    }
    
    return self;
}

- (void)parseCategoryData:(NSData *)data {
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
//    //转换整个JSON数组
    array = [DIECategoryModel modelsFromJSONArray:array];
    [_categoryArray addObjectsFromArray:array];
}

- (NSArray *)categoryArray {
//    //获取Main Bundle下文件路径，如果不存在，返回nil
    NSString *path = [[NSBundle mainBundle] pathForResource:@"categoryData" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
//    //解析数据
    [self parseCategoryData:data];
    
    return [_categoryArray copy];
}
@end
