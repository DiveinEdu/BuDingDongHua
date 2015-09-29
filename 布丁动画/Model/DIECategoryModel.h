//
//  DIECategoryModel.h
//  布丁动画
//
//  Created by apple on 15/9/28.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Mantle.h"

@interface DIECategoryModel : MTLModel <MTLJSONSerializing>
@property (nonatomic, copy) NSString *categoryId;//_id
@property (nonatomic, assign) NSInteger  animeCount;//animeCount
@property (nonatomic, copy) NSString *name;//name
@property (nonatomic, assign) CGFloat height;//image -> height
@property (nonatomic, assign) CGFloat width;//image -> width
@property (nonatomic, copy) NSURL *url;
//字典和数据模型对象相互转换
- (instancetype)initWithJSONDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
//简便的对象创建方法
+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary;
+ (NSArray *)modelsFromJSONArray:(NSArray *)array;
@end
