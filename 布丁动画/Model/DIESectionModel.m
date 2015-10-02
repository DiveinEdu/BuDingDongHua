//
//  DIESectionModel.m
//  布丁动画
//
//  Created by apple on 15/10/1.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIESectionModel.h"

@implementation DIESectionModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"duration":@"duration",
             @"fileType":@"fileType",
             @"number":@"nsnumber",
             @"videoUrl":@"videoUrl",
             @"directParseHost":@"directParseHost",
             @"directParseScript":@"directParseScript"
             };
}

+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary {
    return [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:dictionary error:nil];
}

+ (NSArray *)modelsFromJSONArray:(NSArray *)array {
    return [MTLJSONAdapter modelsOfClass:[self class] fromJSONArray:array error:nil];
}

+ (NSValueTransformer *)urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}
@end
