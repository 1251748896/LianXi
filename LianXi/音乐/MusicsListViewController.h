//
//  MusicsListViewController.h
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

#import "MusicPlayerViewController.h"


@interface MusicsListViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end
