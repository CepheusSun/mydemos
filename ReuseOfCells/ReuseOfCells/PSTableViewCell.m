//
//  PSTableViewCell.m
//  ReuseOfCells
//
//  Created by 孙扬 on 16/6/22.
//  Copyright © 2016年 MichealSun. All rights reserved.
//

#import "PSTableViewCell.h"


@interface  PSTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation PSTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifire = @"PSTableViewCell";
    PSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifire];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifire owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setItem:(id)item {
    _item = item;
    self.contentLabel.text = [NSString stringWithFormat:@"这是第：%@个section 的第%@ 个元素",item[0],item[1]];

}

@end
