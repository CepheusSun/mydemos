//
//  PSHeaderView.m
//  ReuseOfCells
//
//  Created by 孙扬 on 16/6/22.
//  Copyright © 2016年 MichealSun. All rights reserved.
//

#import "PSHeaderView.h"

@interface PSHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation PSHeaderView

+ (instancetype)headerViewWithTableview:(UITableView *)tableView {
    static NSString *identifier = @"PSHeaderView";
    PSHeaderView *headerview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (headerview == nil) {
        headerview = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] firstObject];
    }
    return headerview;
}

- (void)setItem:(id)item {
    _item = item;
    self.detailLabel.text = [NSString stringWithFormat:@"这是第:%@个section的Header",item];
}

@end
