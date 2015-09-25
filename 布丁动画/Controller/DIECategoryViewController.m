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
#import "DIECategoryCell.h"

#import "UIImageView+WebCache.h"

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
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
        [_collectionView registerClass:[DIECategoryCell class] forCellWithReuseIdentifier:@"cell"];
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
    DIECategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSURL *url = [NSURL URLWithString:@"http://7d9rdc.com1.z0.glb.clouddn.com/@/category/541b9347acacae05708b4685/6421dbbbb51d74df3084d725a855bf15.jpg"];
    [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"timeline_subject_add_icon"]];
    cell.titleLabel.text = @"7月新番";
    
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
