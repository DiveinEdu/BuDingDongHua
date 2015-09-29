//
//  DIEDetailViewController.m
//  布丁动画
//
//  Created by apple on 15/9/25.
//  Copyright © 2015年 戴维营教育. All rights reserved.
//

#import "DIEDetailViewController.h"
#import "DIECategoryDetailCell.h"

@interface DIEDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation DIEDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[DIECategoryDetailCell class] forCellReuseIdentifier:@"cell"];
    tableView.backgroundColor = [UIColor clearColor];
//    tableView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
//    tableView.contentSize = CGSizeMake(tableView.contentSize.width - 20, tableView.contentSize.height);
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DIECategoryDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

@end
