//
//  ListViewController.h
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

#import "SpotBankCardViewController.h"
#import "LocalizationViewController.h"
#import "TextStyleViewController.h"
#import "MusicsListViewController.h"
#import "VideoListViewController.h"
#import "SpotBankCardViewController.h"
#import "FatherViewController.h"
#import "AnimationViewController.h"
#import "ChatClientViewController.h"
#import "CntainerViewController.h"
#import "AutoLayoutViewController.h"
#import "WaterFallViewController.h"
#import "ARC_TestViewController.h"
#import "BaiduMapTestViewController.h"
#import "BundleTestViewController.h"
#import "SocketTestViewController.h"
#import "FriendDynamicViewController.h"
#import "FriendsListViewController.h" // 本地聊天里面的控制器
#import "DuoTaiViewController.h"
#import "TurnPicViewController.h"



@interface ListViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger currentPage;

@end
