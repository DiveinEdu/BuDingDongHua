//
//  DIEVideo.h
//  布丁动画
//
//  Created by apple on 15/9/30.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Mantle.h"

@interface DIEVideoModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString * videoId;
@property (nonatomic, strong) NSString * epId;
@property (nonatomic, assign) NSInteger source;
@property (nonatomic, strong) NSString * sourceWording;
@property (nonatomic, strong) NSURL * url;

@property (nonatomic, strong) NSArray *availableQualities;
@property (nonatomic, assign) BOOL playDirectly;
@property (nonatomic, strong) NSDictionary *quality;
@property (nonatomic, assign) NSInteger playerType;
@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, strong) NSArray *videoPageUrl;
@property (nonatomic, strong) NSArray *videoTimeSnippets;

//简便的对象创建方法
+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary;
+ (NSArray *)modelsFromJSONArray:(NSArray *)array;
@end
