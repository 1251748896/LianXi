//
//  BaiduMapTestViewController.h
//  LianXi
//
//  Created by Mac on 17/5/9.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

//1.导入头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>


//demo 控制器
#import "BaseMapViewController.h"


@interface BaiduMapTestViewController : BaseViewController<BMKGeneralDelegate,UITableViewDelegate,UITableViewDataSource>//3.设置代理
{
    BMKMapManager *_mapManager;
    NSArray *_listArray;
}

@property (nonatomic, strong) UITableView *tableView;

@end
