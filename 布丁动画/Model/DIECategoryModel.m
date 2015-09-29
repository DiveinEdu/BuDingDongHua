//
//  DIECategoryModel.m
//  布丁动画
//
//  Created by apple on 15/9/28.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIECategoryModel.h"

NSString * const kCategoryId = @"_id";
NSString * const kCategoryAnimeCount = @"animeCount";
NSString * const kCategoryName = @"name";

NSString * const kCategoryImage = @"image";
NSString * const kCategoryImageWidth = @"width";
NSString * const kCategoryImageHeight = @"height";
NSString * const kCategoryImageUrl = @"url";

@implementation DIECategoryModel
//- (instancetype)initWithJSONDictionary:(NSDictionary *)dictionary {
//    if (self = [super init]) {
//        _categoryId = dictionary[kCategoryId];
//        _name = dictionary[kCategoryName];
//        _animeCount = [dictionary[kCategoryAnimeCount] integerValue];
//        NSDictionary *imageDict = dictionary[kCategoryImage];
//        _width = [imageDict[kCategoryImageWidth] floatValue];
//        _height = [imageDict[kCategoryImageHeight] floatValue];
//        //获取图片地址并转换类型
//        _url = [NSURL URLWithString:imageDict[kCategoryImageUrl]];
//    }
//    return self;
//}
//
//- (NSDictionary *)JSONDictionary {
//    return @{kCategoryId:_categoryId,
//             kCategoryName:_name,
//             kCategoryImage:@{
//                kCategoryImageWidth:@(_width),
//                kCategoryImageHeight:@(_height),
//                kCategoryImageUrl:_url.absoluteString
//             }
//            };
//}
//
//+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary {
//    return [[self alloc] initWithJSONDictionary:dictionary];
//}
//
//+ (NSArray *)modelsFromJSONArray:(NSArray *)array {
//    NSMutableArray *models = [NSMutableArray array];
//    for (NSDictionary *dict in array) {
//        [models addObject:[self modelFromJSONDictionary:dict]];
//    }
//    return [models copy];
//}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"categoryId":@"_id",
        @"animeCount":@"animeCount",
        @"name":@"name",
        @"width":@"image.width",
        @"height":@"image.height",
        @"url":@"image.url"
    };
}

+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary {
    return [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:dictionary error:nil];
}

+ (NSArray *)modelsFromJSONArray:(NSArray *)array {
    return [MTLJSONAdapter modelsOfClass:[DIECategoryModel class] fromJSONArray:array error:nil];
}
@end
