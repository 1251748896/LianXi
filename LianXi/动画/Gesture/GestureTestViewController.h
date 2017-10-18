//
//  GestureTestViewController.h
//  LianXi
//
//  Created by Mac on 17/5/3.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"


typedef NS_ENUM(NSUInteger, MyGestureType) {
    MyGestureTypePan = 0,
    MyGestureTypePin = 1,
    MyGestureTypeTap = 2,
    MyGestureTypeSwipe = 3,
    MyGestureTypeLongPress = 4,
    MyGestureTypeRoTation = 5,
    MyGestureTypeScreenEdgePan = 6,
};


@interface GestureTestViewController : BaseViewController
@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSMutableArray *images;


@property (nonatomic, strong) UIButton *changeBtn;

@end
