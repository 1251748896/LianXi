//
//  CABasicAnimationViewController.h
//  LianXi
//
//  Created by Mac on 17/4/26.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"



//基本动画---->属性动画(通过修改属性，实现动画效果)
@interface CABasicAnimationViewController : BaseViewController<CAAnimationDelegate>


@property (nonatomic, strong) UIView *testView;

@end
