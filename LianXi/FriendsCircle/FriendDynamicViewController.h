//
//  FriendDynamicViewController.h
//  LianXi
//
//  Created by Mac on 17/7/4.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"
#import "FriendCircleListCell.h"

@interface FriendDynamicViewController : BaseViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger currentPage;

@end
