//
//  DIECategoryDetailCell.h
//  布丁动画
//
//  Created by apple on 15/9/29.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIEStarControl.h"

@interface DIECategoryDetailCell : UITableViewCell
@property (nonatomic, strong, readonly) UIImageView *cartoonImageView;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *kindLabel;
@property (nonatomic, strong, readonly) UILabel *countLabel;
@property (nonatomic, strong, readonly) DIEStarControl *starControl;
@end
