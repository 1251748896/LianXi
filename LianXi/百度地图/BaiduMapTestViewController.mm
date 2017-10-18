//
//  BaiduMapTestViewController.m
//  LianXi
//
//  Created by Mac on 17/5/9.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaiduMapTestViewController.h"

static NSString *const baiduAk = @"UUKhB4bVtP6kzLknzqwHyzwdqcyAX2wX";

@interface BaiduMapTestViewController ()

@end

@implementation BaiduMapTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //2.初始化及相关设置
    //使用百度地图之前，先启动BaiduMapManager
    _mapManager = [[BMKMapManager alloc] init];
    
    /**
     *百度地图SDK所有接口均支持百度坐标（BD09）和国测局坐标（GCJ02），用此方法设置您使用的坐标类型.
     *默认是BD09（BMK_COORDTYPE_BD09LL）坐标.
     *如果需要使用GCJ02坐标，需要设置CoordinateType为：BMK_COORDTYPE_COMMON.
     */
    if ([BMKMapManager setCoordinateTypeUsedInBaiduMapSDK:BMK_COORDTYPE_BD09LL]) {
        NSLog(@"经纬度类型设置成功");
    } else {
        NSLog(@"经纬度类型设置失败");
    }
    //3.设置代理(已经在.h文件中处理)
    BOOL ret = [_mapManager start:@"Please enter your key" generalDelegate:self];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    _listArray = [[NSArray alloc]initWithObjects:
                      @"基本/个性化地图功能-MapViewBaseDemo",
                      @"多地图使用功能-MultiMapViewDemo",
                      @"图层展示功能-MapViewDemo",
                      @"地图操作功能-MapViewControlDemo",
                      @"UI控制功能-MapViewUISettingDemo",
                      @"定位功能-LocationDemo",
                      @"覆盖物功能-AnnotationDemo",
                      @"自定义绘制-CustomOverlayDemo",
                      @"POI搜索功能-PoiSearchDemo",
                      @"地理编码功能-GeocodeDemo",
                      @"路径规划功能-RouteSearchDemo",
                      @"公交线路查询-BusLineSearch",
                      @"行政区域检索功能-DistrictSearchDemo",
                      @"离线地图功能-OfflineDemo",
                      @"热力图功能-HeatMapDemo",
                      @"短串分享功能-ShortUrlShareDemo",
                      @"云检索功能-CloudSearchDemo",
                      @"调启地图客户端-OpenMapDemo",
                      @"OpenGL绘制功能-OpenGLDemo",
                      @"收藏夹功能-FavoritesDemo",
                      @"周边雷达功能-Radar",
                      @"点聚合功能-ClusterDemo",
                      @"tileLayer功能-TileLayerDemo",
                      @"室内功能-IndoorDemo",
                      @"运动轨迹示例-SportPathDemo",
                      nil];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = _listArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BaseMapViewController *vc = [[BaseMapViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)onGetNetworkState:(int)iError {
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
}

- (void)onGetPermissionState:(int)iError {
    if (0 == iError) {
        NSLog(@"授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
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
