//
//  DIESegmentView.m
//  布丁动画
//
//  Created by apple on 15/9/24.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIESegmentView.h"

@interface DIESegmentView ()
{
    UIView *_indicatorView;
}
@end

@implementation DIESegmentView

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = [titleArray copy];
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (titleArray.count) {
        CGFloat width = self.bounds.size.width / _titleArray.count;
        CGFloat height = self.bounds.size.height - 2;
        
        //布局标题
        for (NSInteger i = 0; i < titleArray.count; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(width * i, 0, width, height)];
            label.text = titleArray[i];
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            
            if (i == 0) {
                label.textColor = [UIColor orangeColor];
            }
            else {
                label.textColor = [UIColor blackColor];
            }
        }
        
        //指示视图
        _indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, height, width, 2)];
        _indicatorView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_indicatorView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
        [self addGestureRecognizer:tap];
    }
}

- (void)didTap:(UITapGestureRecognizer *)recognizer {
    if (_titleArray.count) {
        CGPoint point = [recognizer locationInView:self];
        
        CGFloat width = self.bounds.size.width / _titleArray.count;
        NSInteger index = point.x / width;
        self.selectedIndex = index;
        
        if (_didValueChanged) {
            _didValueChanged(self);
        }
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    UILabel *deselectedLabel = [self.subviews objectAtIndex:_selectedIndex];
    deselectedLabel.textColor = [UIColor blackColor];
    
    UILabel *selectedLabel = [self.subviews objectAtIndex:selectedIndex];
    selectedLabel.textColor = [UIColor orangeColor];
    
    CGFloat width = self.bounds.size.width / _titleArray.count;
    
    CGRect rect = _indicatorView.frame;
    rect.origin.x = width * selectedIndex;
    _indicatorView.frame = rect;
    
    _selectedIndex = selectedIndex;
}

@end
