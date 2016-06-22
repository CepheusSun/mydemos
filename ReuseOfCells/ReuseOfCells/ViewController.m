//
//  ViewController.m
//  ReuseOfCells
//
//  Created by 孙扬 on 16/6/22.
//  Copyright © 2016年 MichealSun. All rights reserved.
//

#import "ViewController.h"
#import "PSFooterView.h"
#import "PSHeaderView.h"
#import "PSTableViewCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray <NSNumber *>* dataSource;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 90;
    self.tableView.sectionHeaderHeight = 50;
    self.tableView.sectionFooterHeight = 100;
    self.navigationController.navigationBar.translucent = NO;
}


#pragma mark - UITableViewDelefate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource[section] integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSTableViewCell *cell = [PSTableViewCell cellWithTableView:tableView];
    cell.item = @[@(indexPath.row),@(indexPath.section)];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PSHeaderView *headerView = [PSHeaderView headerViewWithTableview:tableView];
    headerView.item = @(section);
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    PSFooterView *footerView = [PSFooterView footerViewWithTableview:tableView];
    footerView.item = @(section);
    footerView.tableView = tableView;
    footerView.section = section;
    return footerView;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        CGFloat sectionHeaderHeight = 200; //sectionHeaderHeight
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        [_dataSource addObject:@(1)];
        [_dataSource addObject:@(3)];
        [_dataSource addObject:@(5)];
        [_dataSource addObject:@(3)];
    }
    return _dataSource;
}



@end
