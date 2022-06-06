//
//  ViewController.m
//  AutolayoutCell
//
//  Created by 张天龙 on 17/3/1.
//  Copyright © 2017年 张天龙. All rights reserved.
//

#import "ViewController.h"
#import "JLStasus.h"
#import "JLStausCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)  UITableView *tableView;

@property (strong, nonatomic) NSArray *statuses;

@end

@implementation ViewController
#pragma mark - lazy
-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}
- (NSArray *)statuses
{
    if (_statuses == nil) {
        // 加载plist中的字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典数组 -> 模型数组
        NSMutableArray *statusArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            JLStasus *status = [JLStasus statusWithDict:dict];
            [statusArray addObject:status];
        }
        
        _statuses = statusArray;
    }
    return _statuses;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JLStausCell *cell = [JLStausCell cellWithTableView:tableView];
    cell.status = self.statuses[indexPath.row];
    return cell;
}

@end
