//
//  CAAnimationGroupViewController.h
//  LianXi
//
//  Created by Mac on 17/4/26.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"


//组动画

@interface CAAnimationGroupViewController : BaseViewController<CAAnimationDelegate>


@property (nonatomic, strong) UIView *testView;

@end
