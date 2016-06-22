//
//  PSFooterView.m
//  ReuseOfCells
//
//  Created by 孙扬 on 16/6/22.
//  Copyright © 2016年 MichealSun. All rights reserved.
//

#import "PSFooterView.h"

@interface PSFooterView ()

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation PSFooterView

+ (instancetype)footerViewWithTableview:(UITableView *)tableView {
    static NSString *identifier = @"PSFooterView";
    PSFooterView *footerview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (footerview == nil) {
        footerview = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] firstObject];
    }
    return footerview;
}

- (void)setItem:(id)item {
    _item = item;
    self.detailLabel.text = [NSString stringWithFormat:@"这是第:%@个section的Footer",item];
}

- (void)setFrame:(CGRect)frame{
    CGRect sectionRect = [self.tableView rectForSection:self.section];
    CGRect newFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMaxY(sectionRect) - CGRectGetHeight(frame), CGRectGetWidth(frame), CGRectGetHeight(frame)); [super setFrame:newFrame];
}

@end
