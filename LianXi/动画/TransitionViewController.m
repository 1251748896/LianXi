//
//  TransitionViewController.m
//  LianXi
//
//  Created by Mac on 17/4/14.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.transition = [[Transitions alloc] initWithNavigationController:self.navigationController];
    
    CATransition *trans = [[CATransition alloc] init];
    trans.type = JiangBoTransitionType(TransitionAnimationTypeRippleEffect);
    trans.duration = 2.0;
    trans.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:trans forKey:@"my"];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(directionEvent:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(directionEvent:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    
    self.navigationItem.title = @"转场动画";
    _testView = [[UIImageView alloc] init];
    _testView.image = [UIImage imageNamed:@"1.jpg"];
    _testView.backgroundColor = [UIColor redColor];
    _testView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_testView];
    _testView.userInteractionEnabled = YES;
    [_testView addGestureRecognizer:swipeRight];
    [_testView addGestureRecognizer:swipeLeft];
    
    // constant:表示_testView在它的参照的View的attribute偏移量
    NSLayoutConstraint * centerX = [NSLayoutConstraint constraintWithItem:_testView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:_testView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-60];
    
    NSLayoutConstraint *widthI = [NSLayoutConstraint constraintWithItem:_testView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:200];

    NSLayoutConstraint *heightI = [NSLayoutConstraint constraintWithItem:_testView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:200*(667.0/375.0)];
    
    [self.view addConstraint:centerX];
    [self.view addConstraint:centerY];
    [self.view addConstraint:widthI];
    [self.view addConstraint:heightI];
    
    _indexLabel = [[UILabel alloc] init];
    self.indexLabel.text = [NSString stringWithFormat:@"第%zd张图片",_imageIndex];
    _indexLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_indexLabel];
    
    NSLayoutConstraint * label_centerY = [NSLayoutConstraint constraintWithItem:_indexLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_testView attribute:NSLayoutAttributeTop multiplier:1.0 constant:-20];
    NSLayoutConstraint *label_centerX = [NSLayoutConstraint constraintWithItem:_indexLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_testView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:label_centerX];
    [self.view addConstraint:label_centerY];
    
}

- (void)directionEvent:(UISwipeGestureRecognizer *)swipe {
    
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        _imageIndex -- ;
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        _imageIndex ++ ;
    }
    
    NSString *type = @"";
    
    if (_imageIndex > 8) {
        _imageIndex = 1;
    } else if (_imageIndex < 1) {
        _imageIndex = 8;
    }
    
    if (_imageIndex > 2) {
        type = @"jpeg";
    } else {
        type = @"jpg";
    }
    
    self.indexLabel.text = [NSString stringWithFormat:@"第%zd张图片",_imageIndex];
    
    NSString *name = [NSString stringWithFormat:@"%zd.%@",_imageIndex,type];
    self.testView.image = [UIImage imageNamed:name];
    
    //单视图转场
    [UIView transitionWithView:self.testView duration:1.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        
        [UIView animateWithDuration:1.0 animations:^{
            self.testView.alpha = 0.5;
        } completion:^(BOOL finished) {
            self.testView.alpha = 1.0;
        }];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

/*
- (void)directionEvent:(UISwipeGestureRecognizer *)swipe {
    
    //
    CATransition *transition = [[CATransition alloc] init];
    //转场的类型
    //cube
    transition.type = @"cube";
    transition.duration = 1.0;
    
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        _imageIndex -- ;
        //转场的方向
        transition.subtype = kCATransitionFromLeft;
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        _imageIndex ++ ;
        //转场的方向
        transition.subtype = kCATransitionFromRight;
    }
    
    NSString *type = @"";
    
    if (_imageIndex > 8) {
        _imageIndex = 1;
    } else if (_imageIndex < 1) {
        _imageIndex = 8;
    }
    
    if (_imageIndex > 2) {
        type = @"jpeg";
    } else {
        type = @"jpg";
    }
    
    
    self.indexLabel.text = [NSString stringWithFormat:@"第%zd张图片",_imageIndex];
    
    NSString *name = [NSString stringWithFormat:@"%zd.%@",_imageIndex,type];
    self.testView.image = [UIImage imageNamed:name];
    
    [self.testView.layer addAnimation:transition forKey:@"trans1"];
    
}
*/



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"layer = %@",self.navigationController.view.layer.animationKeys);
}

- (IBAction)pushBtnClick:(id)sender {
    
    PushTestViewController *vc = [[PushTestViewController alloc] init];
    
    CATransition *trans = [[CATransition alloc] init];
    trans.type = @"cube";
    trans.duration = 2.0;
    trans.subtype = kCATransitionFromLeft;
    [self.navigationController.view.layer addAnimation:trans forKey:@"my"];
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
