//
//  DIESectionModel.h
//  布丁动画
//
//  Created by apple on 15/10/1.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <Foundation/Foundation.h>
 
#import "Mantle.h"

@interface DIESectionModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSInteger duration;
@property (nonatomic, assign) NSInteger fileType;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) NSURL * videoUrl;
@property (nonatomic, strong) NSString *directParseHost;
@property (nonatomic, strong) NSString *directParseScript;

@end
