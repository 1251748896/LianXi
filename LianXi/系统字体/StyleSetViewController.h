//
//  StyleSetViewController.h
//  LianXi
//
//  Created by Mac on 17/4/11.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^ChangeTextStyleBlock)(NSString *style);


@interface StyleSetViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSString *_style;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *sectionArray;
@property (nonatomic, strong) NSMutableArray *sectionStateArray;
@property (nonatomic, strong) NSMutableArray *detailArray;
@property (nonatomic, copy) ChangeTextStyleBlock change;

@end
