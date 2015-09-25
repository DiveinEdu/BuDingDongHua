//
//  DIECategoryCell.m
//  布丁动画
//
//  Created by apple on 15/9/25.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIECategoryCell.h"

#import "Masonry.h"

@implementation DIECategoryCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] init];
        _imageView.layer.cornerRadius = 4;
        _imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.equalTo(self.contentView);
            make.height.equalTo(self.contentView.mas_width);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_imageView.mas_bottom);
            make.left.and.right.equalTo(self.contentView);
        }];
    }
    
    return self;
}
@end
