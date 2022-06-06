//
//  JLStausCell.m
//  AutolayoutCell
//
//  Created by 张天龙 on 17/3/1.
//  Copyright © 2017年 张天龙. All rights reserved.
//

#import "JLStausCell.h"
#import "JLStasus.h"

@interface JLStausCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation JLStausCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    JLStausCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    return cell;
}



- (void)setStatus:(JLStasus *)status
{
    _status = status;
    
    if (status.isVip) {
        self.nameLabel.textColor = [UIColor orangeColor];
        self.vipView.hidden = NO;
    } else {
        self.nameLabel.textColor = [UIColor blackColor];
        self.vipView.hidden = YES;
    }
    
    self.nameLabel.text = status.name;
    self.timeLabel.text = @"2020-09-08";
    self.iconView.image = [UIImage imageNamed:status.icon];
    self.contentLabel.text = status.text;
    if (status.picture) {//好挫的做法，无法隐藏
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:status.picture];
    } else {
        self.pictureView.hidden = YES;
    }

}



@end
