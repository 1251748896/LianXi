//
//  BaseMapViewController.h
//  LianXi
//
//  Created by Mac on 17/5/9.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

#import <BaiduMapAPI_Map/BMKMapComponent.h>


@interface BaseMapViewController : BaseViewController<BMKMapViewDelegate> {
    BMKMapView *_mapView;//Localization native development region
    BOOL enableCustomMap;//Localization native development region
}

@end
