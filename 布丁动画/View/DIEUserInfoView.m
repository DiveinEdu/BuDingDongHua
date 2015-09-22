//
//  DIEUserInfoView.m
//  布丁动画
//
//  Created by apple on 15/9/22.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIEUserInfoView.h"

@interface DIEUserInfoView ()
{
    UILabel *_label;
}
@end

@implementation DIEUserInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UILabel *label = [[UILabel alloc] initWithFrame: self.bounds];
        [self addSubview:label];
        
        _label = label;
    }
    
    return self;
}

- (void)setTitle:(NSString *)title {
    _label.text = title;
}

- (NSString *)title {
    return _label.text;
}

@end
