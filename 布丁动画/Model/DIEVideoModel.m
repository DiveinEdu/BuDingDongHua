//
//  DIEVideo.m
//  布丁动画
//
//  Created by apple on 15/9/30.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIEVideoModel.h"
#import "DIESectionModel.h"

@implementation DIEVideoModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
         @"videoId":@"_id",
         @"epId":@"epId",
         @"source":@"source",
         @"url":@"url",
         @"sourceWording":@"sourceWording",
         @"availableQualities":@"availableQualities",
         @"playDirectly":@"playDirectly",
         @"quality":@"quality",
         @"playerType":@"playerType",
         @"sections":@"sections",
         @"videoPageUrl":@"videoPageUrl",
         @"videoTimeSnippets":@"videoTimeSnippets"
    };
}

+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary {
    return [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:dictionary error:nil];
}

+ (NSArray *)modelsFromJSONArray:(NSArray *)array {
    return [MTLJSONAdapter modelsOfClass:[self class] fromJSONArray:array error:nil];
}

//指定特定属性的转换规则
+ (NSValueTransformer *)urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)videoPageUrlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)sectionsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[DIESectionModel class]];
}

//指定特定属性的合并规则
- (void)mergeVideoIdFromModel:(NSObject<MTLModel> *)model {
}

- (void)mergeEpIdFromModel:(NSObject<MTLModel> *)model {
}

- (void)mergeSourceFromModel:(NSObject<MTLModel> *)model {
}

- (void)mergeSourceWordingFromModel:(NSObject<MTLModel> *)model {
}

- (void)mergeUrlFromModel:(NSObject<MTLModel> *)model {
}
@end
