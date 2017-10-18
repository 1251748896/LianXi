//
//  ListViewController.m
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "ListViewController.h"

#import "YDDemoViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeUserInterface];
//    [self initializeDataSource];
    
}


- (void)initializeDataSource {
    
    //    NSString *url = @"https://www.scyd360.com/api/Index/index";
    
    __weak typeof(self) weakself = self;
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [self get:kMusicUrl paramter:dic success:^(NSDictionary *dic) {
        //list
        for (NSDictionary *d in dic[@"tracks"][@"list"]) {
            MusicListModel *model = [[MusicListModel alloc] initWithDictionary:d];
            [weakself.dataArray addObject:model];
        }
        [weakself.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}


- (void)initializeUserInterface {
    
    self.navigationItem.title = @"首页";
    
    [self.dataArray addObject:@"本地存储"];
    [self.dataArray addObject:@"系统字体"];
    [self.dataArray addObject:@"音乐播放"];
    [self.dataArray addObject:@"视频播放"];
    [self.dataArray addObject:@"识别银行卡"];
    [self.dataArray addObject:@"仿网易新闻"];
    [self.dataArray addObject:@"动画"];
    [self.dataArray addObject:@"本地聊天Client"];
    [self.dataArray addObject:@"抽屉效果"];
    [self.dataArray addObject:@"系统自动布局"];
    [self.dataArray addObject:@"瀑布流"];
    [self.dataArray addObject:@"内存管理"];
    [self.dataArray addObject:@"百度地图"];
    [self.dataArray addObject:@"读取工程文件"];
    [self.dataArray addObject:@"socket"];
    [self.dataArray addObject:@"朋友圈"];
    [self.dataArray addObject:@"多态"];
    [self.dataArray addObject:@"有道翻译"];
    [self.dataArray addObject:@"轮播图封装"];
    
    
    self.tableView.rowHeight = 44;
    
//    [self.dataArray addObject:@""];
//    [self.dataArray addObject:@""];
//    [self.dataArray addObject:@""];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
//    
//    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
//    //x和y的最终值为1
//    [UIView animateWithDuration:2 animations:^{
//        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
//    }];
//    
    //UITableViewCellStyle
    /*
     default:一个label和image
     Value1:左label左 右label右
     Value2:左label右 右label左 没imageView
     Subtitle:上下
     */
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        LocalizationViewController *local = [[LocalizationViewController alloc] init];
        [self.navigationController pushViewController:local animated:YES];
    } else if (indexPath.row == 1) {
        TextStyleViewController *style = [[TextStyleViewController alloc] init];
        [self.navigationController pushViewController:style animated:YES];
    } else if (indexPath.row == 2) {
        MusicsListViewController *music = [[MusicsListViewController alloc] init];
        [self.navigationController pushViewController:music animated:YES];
    } else if (indexPath.row == 3) {
        VideoListViewController *video = [[VideoListViewController alloc] init];
        [self.navigationController pushViewController:video animated:YES];
    } else if (indexPath.row == 4) {
        SpotBankCardViewController *vc = [[SpotBankCardViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 5) {
        FatherViewController *vc = [[FatherViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 6) {
        AnimationViewController *vc = [[AnimationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 7) {
        ChatClientViewController *vc = [[ChatClientViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 8) {
        CntainerViewController *vc = [[CntainerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 9) {
        AutoLayoutViewController *vc = [[AutoLayoutViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 10) {
        WaterFallViewController *vc = [[WaterFallViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    } else if (indexPath.row == 11) {
        ARC_TestViewController *vc = [[ARC_TestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        /*
         伪转场
        UIWindow* window = [UIApplication sharedApplication].delegate.window;
        //添加动画
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:window cache:YES];
        [UIView commitAnimations];
         */
    } else if (indexPath.row == 12) {
        BaiduMapTestViewController *vc = [[BaiduMapTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 13) {
        BundleTestViewController *vc = [[BundleTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 14) {
        SocketTestViewController *vc = [[SocketTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 15) {
        FriendDynamicViewController *vc = [[FriendDynamicViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 16) {
        DuoTaiViewController *vc = [[DuoTaiViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 17) {
        YDDemoViewController *vc = [[YDDemoViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 18) {
        TurnPicViewController *vc = [[TurnPicViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
     ////////////////////////////11111111///////////////////////
    
    //设置Cell的动画效果为3D效果
    /*
     //http://blog.sina.com.cn/s/blog_8f5097be0101b91z.html
     
     CATransform3DMakeScale(<#CGFloat sx#>, <#CGFloat sy#>, <#CGFloat sz#>)
     sx：X轴缩放，代表一个缩放比例，一般都是 0 --- 1 之间的数字。
     sy：Y轴缩放。
     sz：整体比例变换时，也就是m11（sx）== m22（sy）时，若m33（sz）>1，图形整体缩小，若0<1，图形整体放大，若m33（sz）<0，发生关于原点的对称等比变换
     
     CATransform3DMakeTranslation (CGFloat tx, CGFloat ty, CGFloat tz)
     tx：X轴偏移位置，往下为正数。
     ty：Y轴偏移位置，往右为正数。
     tz：Z轴偏移位置，往外为正数。
     
     */
    
    //设置x和y的初始值为0.1；
//    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
//    //x和y的最终值为1
//    [UIView animateWithDuration:1 animations:^{
//        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
//    }];
    
    
    ////////////////////////////2222222222///////////////////////
    /*
    if (indexPath.row % 2 != 0) {
        cell.transform = CGAffineTransformTranslate(cell.transform, self.view.bounds.size.width/2, 0);
        
    }else{
        cell.transform = CGAffineTransformTranslate(cell.transform, -self.view.bounds.size.width/2, 0);
    }
    cell.alpha = 0.0;
    
    [UIView animateWithDuration:7 animations:^{
        
        cell.transform = CGAffineTransformIdentity;
        
        cell.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        
    }];
    */
    
     ////////////////////////////333333333///////////////////////
    
    
    
    
}

/*
 //插入动画的核心代码
-(void)charusell{
 //self.indesPaths是一个数组
    self.DatNum = self.DatNum +1;
    if (self.DatNum < self.dataArr.count) {
        [self.indesPaths addObject:[NSIndexPath indexPathForItem:self.DatNum inSection:0]];
        [self.tableView insertRowsAtIndexPaths:self.indesPaths withRowAnimation:UITableViewRowAnimationRight];
        [self.indesPaths removeAllObjects];
    }else{
        [self.timer invalidate];
        //记得当不用这个定时器的时候要销毁.
        self.timer = nil;
    }
}
*/
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
