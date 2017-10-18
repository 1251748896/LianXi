//
//  CAKeyframeAnimationViewController.m
//  LianXi
//
//  Created by Mac on 17/4/26.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"

@interface CAKeyframeAnimationViewController ()

@end

@implementation CAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _testView = [[UIView alloc] init];
    _testView.frame = CGRectMake(50, 50, 50, 50);
    _testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_testView];
    
    [self test2];
    
}

- (void)test2 {
    
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    keyframe.repeatCount = CGFLOAT_MAX;
    keyframe.values = @[@(-M_PI_4*0.1*2),@(M_PI_4*0.1*2),@(-M_PI_4*0.1*2)];
    [self.testView.layer addAnimation:keyframe forKey:@"key2"];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设置动画属性
    /*
     
     通过value设置属性
    NSValue *position1 = [NSValue valueWithCGPoint:CGPointMake(50, 150)];
    NSValue *position2 = [NSValue valueWithCGPoint:CGPointMake(250, 150)];
    NSValue *position3 = [NSValue valueWithCGPoint:CGPointMake(50, 550)];
    NSValue *position4 = [NSValue valueWithCGPoint:CGPointMake(250, 550)];
    
    keyframe.values = @[position1,position2,position3,position4];
     */
    
    /*
    //贝塞尔曲线--->椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 100, 250, 100)];
    keyframe.path = path.CGPath;
    */
    
    //旋转的形式
    keyframe.rotationMode = kCAAnimationRotateAuto;
    keyframe.duration = 3.0;
    
    [self.testView.layer addAnimation:keyframe forKey:@"key1"];
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
