//
//  PicLaShenViewController.h
//  LianXi
//
//  Created by Mac on 17/5/3.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"


#define kHEIGHT 170.0



@interface PicLaShenViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end
