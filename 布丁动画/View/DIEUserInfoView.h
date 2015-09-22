//
//  DIEUserInfoView.h
//  布丁动画
//
//  Created by apple on 15/9/22.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIEUserInfoView : UIView
//1. weak和strong
//2.
//@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, copy) NSString *title;
@end
