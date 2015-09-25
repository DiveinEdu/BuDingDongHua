//
//  DIECategoryFlowLayout.m
//  布丁动画
//
//  Created by apple on 15/9/25.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIECategoryFlowLayout.h"

#import "DIEToolkit.h"

@implementation DIECategoryFlowLayout
- (instancetype)init {
    if (self = [super init]) {
        self.itemSize = CGSizeMake(90, 112);
        
        CGFloat margin = 10.0;
        if (kDIEIsIPhone6) {
            margin = 30.0;
        }
        
        self.sectionInset = UIEdgeInsetsMake(10, margin, 10, margin);
        self.minimumLineSpacing = 14;
        self.minimumInteritemSpacing = 10;
    }
    
    return self;
}
@end
