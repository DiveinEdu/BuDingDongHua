//
//  DIECategoryDetailCell.m
//  布丁动画
//
//  Created by apple on 15/9/29.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIECategoryDetailCell.h"

@implementation DIECategoryDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *bgView = [[UIView alloc] init];
        [self.contentView addSubview:bgView];
        
        _cartoonImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_cartoonImageView];
        
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        
        _kindLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_kindLabel];
        
        _countLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_countLabel];
        
        _starControl = [[DIEStarControl alloc] init];
        [self.contentView addSubview:_starControl];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
