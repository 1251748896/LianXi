//
//  BaseMapViewController.m
//  LianXi
//
//  Created by Mac on 17/5/9.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseMapViewController.h"


@interface BaseMapViewController ()

@end

@implementation BaseMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     *注：必须在BMKMapView对象初始化之前设置自定义地图样式，设置后会影响所有地图实例
     *设置方法：+ (void)customMapStyle:(NSString*) customMapStyleJsonFilePath;
     */
//    enableCustomMap = segment.selectedSegmentIndex == 1;
    //打开/关闭个性化地图
    [BMKMapView enableCustomMapStyle:YES];
}

#pragma mark - <----处理内存问题---->

-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    [BMKMapView enableCustomMapStyle:enableCustomMap];
}

-(void)viewWillDisappear:(BOOL)animated {
    [BMKMapView enableCustomMapStyle:NO];//关闭个性化地图
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}
#pragma mark - <----处理内存问题---->


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
