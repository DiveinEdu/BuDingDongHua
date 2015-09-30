//
//  DIEError.m
//  布丁动画
//
//  Created by apple on 15/9/29.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIEError.h"

@implementation DIEError

- (instancetype)initWithCode:(NSInteger)code {
    if (self = [super init]) {
        _errorCode = code;
    }
    
    return self;
}

- (instancetype)initWithError:(NSError *)error {
    if (self = [super init]) {
        //转换
    }
    
    return self;
}

+ (instancetype)errorWithCode:(NSInteger)code {
    return [[[self class] alloc] initWithCode:code];
}

- (NSString *)explainErrorCode {
    NSString *reason = nil;
    switch (_errorCode) {
        case kDIENetworkErrorCodeNotFound:
            reason = @"资源不存在";
            break;
        case kDIENetworkErrorCodeNotAuth:
            reason = @"没有登录";
            break;
        default:
            break;
    }
    
    return reason;
}

- (NSString *)reason {
    if (!_reason) {
        _reason = [self explainErrorCode];
    }
    
    return _reason;
}
@end
