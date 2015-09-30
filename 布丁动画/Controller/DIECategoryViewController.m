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

#import "DIEDataManager.h"
#import "DIECategoryModel.h"

#import "DIENotificationConfig.h"

#import "DIEToolkit.h"

#import "UIImageView+WebCache.h"
#import "AFNetworking.h"

@interface DIECategoryViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    UICollectionView *_collectionView;
    
    NSArray *_categoryArray;
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
    
    DIEAddObserver(self, @selector(didUpdate), kDIECategoryUpdateNotif, nil);
    
    //获取分类数据
    [[DIEDataManager sharedManager] updateCategory];
//    NSDictionary *dict = @{@"offset":@0, @"limit":@24};
//    
//    [[AFHTTPSessionManager manager] GET:[DIEToolkit categoryApi] parameters:[DIEToolkit fullParams:dict] success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"%@", responseObject);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"%@", error);
//    }];
    
    [self collectionView];
    [self.view addSubview:_collectionView];
}

- (void)didUpdate {
    _categoryArray = [DIEDataManager sharedManager].categoryArray;
    [_collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 2;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _categoryArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DIECategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
//    NSDictionary *dict = _categoryArray[indexPath.item];
//    NSDictionary *imageDict = dict[@"image"];
//    
//    NSURL *url = [NSURL URLWithString:imageDict[@"url"]];
//    
//    [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"timeline_subject_add_icon"]];
//    
//    cell.titleLabel.text = dict[@"name"];
    
    //获取一个类别的信息
    DIECategoryModel *category = _categoryArray[indexPath.item];
    [cell.imageView sd_setImageWithURL:category.url placeholderImage:[UIImage imageNamed:@"timeline_subject_add_icon"]];
    //获取类别的名称
    cell.titleLabel.text = category.name;
    
    return cell;
}

//选择漫画
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld, %ld", indexPath.section, indexPath.item);
    
    DIEDetailViewController *detailCtrl = [[DIEDetailViewController alloc] init];
    detailCtrl.category = _categoryArray[indexPath.item];
    [self.navigationController pushViewController:detailCtrl animated:YES];
//    NSLog(@"%@", self.parentViewController);
//    [self.parentViewController.navigationController pushViewController:detailCtrl animated:YES];
}

- (void)dealloc {
    DIERemoveObserver(self, kDIECategoryUpdateNotif, nil);
}
@end
