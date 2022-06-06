//
//  JLStasus.m
//  AutolayoutCell
//
//  Created by 张天龙 on 17/3/1.
//  Copyright © 2017年 张天龙. All rights reserved.
//

#import "JLStasus.h"

@implementation JLStasus

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    JLStasus *status = [[self alloc] init];
    [status setValuesForKeysWithDictionary:dict];
    return status;
}

@end
