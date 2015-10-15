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
#import "UIScrollView+INSPullToRefresh.h"
#import "INSLabelPullToRefresh.h"
#import "INSDefaultInfiniteIndicator.h"

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
    //1. 下拉刷新，如果有新数据，需要将所有数据清理并换用新数据
    //2. 上拉加载更多，需要保留老数据，只是追加新数据
    
    //添加观察者
    DIEAddObserver(self, @selector(didUpdate), kDIECategoryUpdateNotif, nil);
    DIEAddObserver(self, @selector(didMore), kDIECategryLoadMoreNotif, nil);

    
    //显示UICollectionView
    [self collectionView];
    [self.view addSubview:_collectionView];
    
    //1. 设置下拉刷新控件
    [_collectionView ins_addPullToRefreshWithHeight:60 handler:^(UIScrollView *scrollView) {
        //2. 从网络上获取分类数据
        [[DIEDataManager sharedManager] updateCategory];
    }];
    
    //设置文字状态
    INSLabelPullToRefresh *pullToRefreshView = [[INSLabelPullToRefresh alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60) noneStateText:@"下拉刷新" triggeredStateText:@"松开开始加载数据" loadingStateText:@"正在更新数据"];
    _collectionView.ins_pullToRefreshBackgroundView.delegate = pullToRefreshView;
    
    [_collectionView.ins_pullToRefreshBackgroundView addSubview:pullToRefreshView];
    
    //3. 手动触发更新动作
    [_collectionView ins_beginPullToRefresh];
    
    [_collectionView ins_addInfinityScrollWithHeight:60 handler:^(UIScrollView *scrollView) {
        NSLog(@"上拉加载更多");
        
        [[DIEDataManager sharedManager] loadMoreCategory];
    }];
    
    INSDefaultInfiniteIndicator *infiniteIndicator = [[INSDefaultInfiniteIndicator alloc] init];
    _collectionView.ins_infiniteScrollBackgroundView.delegate = infiniteIndicator;
    [infiniteIndicator startAnimating];
    [_collectionView.ins_infiniteScrollBackgroundView addSubview:infiniteIndicator];
}

- (void)didUpdate {
    //4. 更新结束，恢复原始位置
    [_collectionView ins_endPullToRefresh];
    
    _categoryArray = [DIEDataManager sharedManager].categoryArray;
    [_collectionView reloadData];
}

//完成加载更多
- (void)didMore {
    [_collectionView ins_endInfinityScroll];
    
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
