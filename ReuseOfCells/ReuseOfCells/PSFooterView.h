//
//  PSFooterView.h
//  ReuseOfCells
//
//  Created by 孙扬 on 16/6/22.
//  Copyright © 2016年 MichealSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSFooterView : UITableViewHeaderFooterView


+ (instancetype)footerViewWithTableview:(UITableView *)tableView;


@property (nonatomic ,strong) id item;



@property NSUInteger section;

@property (nonatomic, weak) UITableView *tableView;

@end
