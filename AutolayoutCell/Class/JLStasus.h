//
//  JLStasus.h
//  AutolayoutCell
//
//  Created by 张天龙 on 17/3/1.
//  Copyright © 2017年 张天龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLStasus : NSObject
/**
名称
 */
@property (strong, nonatomic) NSString *name;
/**
 内容
 */
@property (strong, nonatomic) NSString *text;
/**
 头像
 */
@property (strong, nonatomic) NSString *icon;
/**
 图片
 */
@property (strong, nonatomic) NSString *picture;
/**
 是否是VIP
 */
@property (assign, nonatomic, getter=isVip) BOOL vip;

/** cell的高度 */
@property (assign, nonatomic) CGFloat cellHeight;

+ (instancetype)statusWithDict:(NSDictionary *)dict;

@end
