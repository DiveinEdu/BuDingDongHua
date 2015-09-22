//
//  LeftTableViewCell.m
//  布丁动画
//
//  Created by apple on 15/9/21.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIELeftTableViewCell.h"

#import "Masonry.h"

@implementation DIELeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@22);
            make.centerY.equalTo(self.contentView);
        }];
        
        self.textLabel.textColor = [UIColor whiteColor];
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageView).offset(40);
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    
    return self;
}

@end
