//
//  AutoLayoutViewController.m
//  LianXi
//
//  Created by Mac on 17/4/25.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"系统自动布局方法";
    
//    _fx = CGRectGetWidth(self.view.bounds)/2.0;
//    _fy = CGRectGetHeight(self.view.bounds)/2.0;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(layoutTest:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:button];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leftLayout = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:50];
    NSLayoutConstraint *topLayout = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100];
    //设置子视图的宽度和父视图的宽度相同
    //参数说明:
    /*
     1.multiplier:与参照对象的倍数关系;(1.0:和参照对象相同,0.5:是参照对象的一半)
     2.constant:这个参数在设置宽度、高度的时候无意义
     3.
     */
    
    _width_btn = 0.5;
    
    NSLayoutConstraint *widthLayout = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:_width_btn constant:0];//最后一个参数可以甩0(任意数都可以)
    
    [self.view addConstraint:widthLayout];
    [self.view addConstraint:topLayout];
    [self.view addConstraint:leftLayout];
    
}

- (void)layoutTest:(UIButton *)sender {
    //这样写，没用啊，哎，烦得很
    if (_width_btn == 1.0) {
        _width_btn = 0.5;
    } else {
        _width_btn = 1.0;
    }
    
    NSLog(@"%f",_width_btn);
    
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
