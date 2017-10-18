//
//  FatherViewController.m
//  LianXi
//
//  Created by Mac on 17/4/13.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "FatherViewController.h"

@interface FatherViewController ()
{
    NSArray *_titleArray;
    NSInteger _littleBtnTag;
    UIView *_blue;
    
}
@end

@implementation FatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _littleBtnTag = 1000;
    
    _lastButtonIndex = _littleBtnTag;
    
    UIButton *btnn = [UIButton buttonWithType:UIButtonTypeCustom];
    btnn.frame = CGRectMake(40, 80, 100, 40);
    btnn.backgroundColor = [UIColor purpleColor];
    [btnn setTitle:@"push" forState:UIControlStateNormal];
    [btnn addTarget:self action:@selector(pushhhh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnn];
    
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    
    _tttt = [[GestureChangeVCTransition alloc] init];
    _tttt.type = TransitionTypePush;
    _tttt.direction = MyGestureDirectionRight;
    
    typeof(self)weakSelf = self;
    
    _tttt.pushConifg = ^() {
        [weakSelf pushhhh];
    };
    
    [_tttt addPanGestureForViewController:self];
    
//    [self initializeUserInterface];
}

- (void)pushhhh {
    TTTTTTViewController *vc = [[TTTTTTViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return nil;
//    return [XWCircleSpreadTransition transitionWithTransitionType:XWCircleSpreadTransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return nil;
//    return [XWCircleSpreadTransition transitionWithTransitionType:XWCircleSpreadTransitionTypeDismiss];
}



- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return nil;
//    return _interactiveTransition.interation ? _interactiveTransition : nil;
}


- (void)initializeUserInterface {
    //
    _titleArray = @[@"第一",@"第二",@"第三"];
    CGFloat button_jianju = 0.5;
    CGFloat button_width = (CGRectGetWidth(self.view.bounds) - ((_titleArray.count-1)*button_jianju))/_titleArray.count;
    CGFloat line_hight = 2.0;
    
//    UIWindow *window  = [[[UIApplication sharedApplication] delegate] window];
    
    _blue = [[UIView alloc] init];
    _blue.backgroundColor = [UIColor redColor];
    _blue.bounds = CGRectMake(0, 0, button_width, line_hight);
    [self.view addSubview:_blue];
    
    for (int i=0; i<_titleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*(button_width + button_jianju), 0, button_width, 52 - line_hight);
        button.tag = i + _littleBtnTag;
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(topBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        [self.view addSubview:button];
        
        [self.buttonArray addObject:button];
        
        if (i == 0) {
            button.selected = YES;
            _blue.frame = CGRectMake(CGRectGetMinX(button.frame), CGRectGetMaxY(button.frame), CGRectGetWidth(button.bounds), line_hight);
        }
        
        if (i != _titleArray.count-1) {
            UIView *layer = [[UIView alloc] init];//UIColorFromRGB(0xe7e7e7)
            layer.backgroundColor = [UIColor lightGrayColor];
            layer.frame = CGRectMake(CGRectGetMaxX(button.frame), CGRectGetMinY(button.frame), button_jianju, CGRectGetHeight(button.bounds));
            [self.view addSubview:layer];
        }
    }
    
    [self showChirldViewControllerWithIndex:0];
}

- (void)showChirldViewControllerWithIndex:(NSInteger)index {
    
    if (index == 0) {
        
        //遍历所有子视图控制器
        for (UIViewController *vc in self.childViewControllers) {
            if ([vc isKindOfClass:[FirstViewController class]]) {
                return;
            }
        }
        
        [self addChildViewController:self.fir];
        
    } else if (index == 1) {
        //遍历所有子视图控制器
        for (UIViewController *vc in self.childViewControllers) {
            if ([vc isKindOfClass:[SecondViewController class]]) {
                return;
            }
        }
        
        [self addChildViewController:self.sec];
        
    } else if (index == 2) {
        //遍历所有子视图控制器
        for (UIViewController *vc in self.childViewControllers) {
            if ([vc isKindOfClass:[ThirdViewController class]]) {
                return;
            }
        }
        
        [self addChildViewController:self.third];
        
    } else if (index == 3) {
        
    }
    
}


- (void)topBtnClick:(UIButton *)button {
    //处理button
    if (button.selected) return;
    button.selected = !button.selected;
    
    for (UIButton *b in self.buttonArray) {
        if (b.selected && b != button) {
            b.selected = !b.selected;
            break;
        }
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        _blue.frame = CGRectMake(CGRectGetMinX(button.frame), CGRectGetMaxY(button.frame), CGRectGetWidth(button.bounds), _blue.bounds.size.height);
    }];
    
    //判断方向
    
    BOOL right = _lastButtonIndex < button.tag;
    
    _lastButtonIndex = button.tag;
    
    //切换自控制器转场
    CATransition *transition = [[CATransition alloc] init];
    transition.type = @"push";
    
    if (right) {
        transition.subtype = kCATransitionFromLeft;
    } else {
        transition.subtype = kCATransitionFromRight;
    }
    
    [self.view.layer addAnimation:transition forKey:@"changeVc"];
    
    [self showChirldViewControllerWithIndex:button.tag - _littleBtnTag];
    
}


- (FirstViewController *)fir {
    if (!_fir) {
        _fir = [[FirstViewController alloc] init];
        _fir.view.frame = CGRectMake(0, 52, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
        
        [self.view addSubview:_fir.view];
    }
    return _fir;
}

- (SecondViewController *)sec {
    if (!_sec) {
        _sec = [[SecondViewController alloc] init];
        _sec.view.frame = CGRectMake(0, 52, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
        
        [self.view addSubview:_sec.view];
    }
    return _sec;
}

- (ThirdViewController *)third {
    if (!_third) {
        _third = [[ThirdViewController alloc] init];
        _third.view.frame = CGRectMake(0, 52, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
        
        [self.view addSubview:_third.view];
    }
    return _third;
}

- (NSMutableArray *)buttonArray {
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
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
