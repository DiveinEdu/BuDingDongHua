//
//  DIECategoryViewController.m
//  布丁动画
//
//  Created by apple on 15/9/21.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIECategoryViewController.h"
#import "DIEDetailViewController.h"

#import "DIECategoryFlowLayout.h"

@interface DIECategoryViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    UICollectionView *_collectionView;
}
@end

@implementation DIECategoryViewController
//创建集合视图(CollectionView)
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        DIECategoryFlowLayout *flowLayout = [DIECategoryFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self collectionView];
    [self.view addSubview:_collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    CGFloat hue = indexPath.item * 1.0 / [self collectionView:collectionView numberOfItemsInSection:indexPath.section];
    cell.backgroundColor = [UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0];
    return cell;
}

//选择漫画
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld, %ld", indexPath.section, indexPath.item);
    
    DIEDetailViewController *detailCtrl = [[DIEDetailViewController alloc] init];
    [self.navigationController pushViewController:detailCtrl animated:YES];
//    NSLog(@"%@", self.parentViewController);
//    [self.parentViewController.navigationController pushViewController:detailCtrl animated:YES];
}
@end
