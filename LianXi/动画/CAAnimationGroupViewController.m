//
//  CAAnimationGroupViewController.m
//  LianXi
//
//  Created by Mac on 17/4/26.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "CAAnimationGroupViewController.h"


@interface CAAnimationGroupViewController ()

@end

@implementation CAAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _testView = [[UIView alloc] init];
    _testView.frame = CGRectMake(50, 50, 80, 80);
    _testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_testView];
}

//组动画 的意思就是把多个动画同时执行。
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    //添加子动画
    //旋转
    CABasicAnimation *Animation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    Animation1.toValue = @(M_PI_2 * 5);
    
    //缩放
    CABasicAnimation *Animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    Animation2.toValue = @(M_PI_2 * 5);
    
    //修改位置
    CAKeyframeAnimation *Animation3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    Animation3.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 100, 250, 100)].CGPath;
    
    group.animations = @[Animation1,Animation2,Animation3];
    
    group.repeatCount = 5;
    group.duration = 3.0;
    
    [self.testView.layer addAnimation:group forKey:@"group1"];
    
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
