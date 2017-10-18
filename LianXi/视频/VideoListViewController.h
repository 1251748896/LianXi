//
//  VideoListViewController.h
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

#import "VideoPlayerViewController.h"
#import "XhsVideoViewController.h"

@interface VideoListViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSMutableArray *dataArray;

@end
