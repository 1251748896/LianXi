//
//  PushTestViewController.m
//  LianXi
//
//  Created by Mac on 17/4/27.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "PushTestViewController.h"

@interface PushTestViewController ()

@end

@implementation PushTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.\
    
    //创建scrollView
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.bounces = NO;
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 2;
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
    UIImageView *_testView = [[UIImageView alloc] init];
    _testView.image = [UIImage imageNamed:@"2.jpg"];
    _testView.tag = 1000;
    _testView.backgroundColor = [UIColor redColor];
    _testView.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addSubview:_testView];
    
    // constant:表示_testView在它的参照的View的attribute偏移量
    NSLayoutConstraint * centerX = [NSLayoutConstraint constraintWithItem:_testView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:_testView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-60];
    
    NSLayoutConstraint *widthI = [NSLayoutConstraint constraintWithItem:_testView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:200];
    
    NSLayoutConstraint *heightI = [NSLayoutConstraint constraintWithItem:_testView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:200*(667.0/375.0)];
    
    [self.view addConstraint:centerX];
    [self.view addConstraint:centerY];
    [self.view addConstraint:widthI];
    [self.view addConstraint:heightI];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(90, 500, 200, 49);
    btn.backgroundColor = [UIColor purpleColor];
    
}

- (void)popViewController {
//    CATransition *pop = [[CATransition alloc] init];
//    pop.type = @"cube";
//    pop.duration = 2.0;
//    pop.subtype = kCATransitionFromRight;
//    [self.navigationController.view.layer addAnimation:pop forKey:@"pop"];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ----UIScrollViewDelegate----
//检测有没有正在进行缩放
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"scrollView比例发生了变化");
}
//返回要缩放的视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"返回要缩放的视图");
    //首先找到要进行缩放的视图
    UIImageView* imageView = (UIImageView* )[scrollView viewWithTag:1000];
    return imageView;
}
//缩放结束
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    //scale：保存的当前的缩放比例
    NSLog(@"结束scale = %f",scale);
    NSLog(@"结束view = %@",view);
    //view：当前缩放的视图
    //设置view的坐标
    if (scale <= 1) {
        //如果比例小于1，那么让这张图片处于scrollView的中心
        view.center = CGPointMake(scrollView.contentOffset.x + 160, 100);
        NSLog(@"view.center = %@",NSStringFromCGPoint(view.center));
    }
    if (scale > 1) {
        view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
        //如果比例大于1，那么根据scale设置scrollView的容量
        scrollView.contentSize = CGSizeMake(320 * scale, 200 * scale);
        NSLog(@"view.center = %@",NSStringFromCGPoint(view.center));
    }
    
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
