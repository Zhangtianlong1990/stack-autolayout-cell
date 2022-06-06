//
//  JLStausCell.h
//  AutolayoutCell
//
//  Created by 张天龙 on 17/3/1.
//  Copyright © 2017年 张天龙. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JLStasus;

@interface JLStausCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** 微博模型数据 */
@property (nonatomic, strong) JLStasus *status;

@end
