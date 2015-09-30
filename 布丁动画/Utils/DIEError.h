//
//  DIEError.h
//  布丁动画
//
//  Created by apple on 15/9/29.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DIENetworkErrorCode) {
    kDIENetworkErrorCodeNotFound = 1001,
    kDIENetworkErrorCodeNotAuth,
};

@interface DIEError : NSObject
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, copy) NSString *reason;

- (instancetype)initWithCode:(NSInteger)code;
- (instancetype)initWithError:(NSError *)error;

+ (instancetype)errorWithCode:(NSInteger)code;
@end
