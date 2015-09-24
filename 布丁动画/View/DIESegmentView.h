//
//  DIESegmentView.h
//  布丁动画
//
//  Created by apple on 15/9/24.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIESegmentView : UIView
@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, copy) void (^didValueChanged)(DIESegmentView *sender);
@end
