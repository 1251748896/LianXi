//
//  CAKeyframeAnimationViewController.h
//  LianXi
//
//  Created by Mac on 17/4/26.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"


//关键帧动画---->属性动画(通过修改属性，实现动画效果)
@interface CAKeyframeAnimationViewController : BaseViewController<CAAnimationDelegate>


@property (nonatomic, strong) UIView *testView;




@end
