//
//  FatherViewController.m
//  LianXi
//
//  Created by Mac on 17/4/24.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "CntainerViewController.h"

@interface CntainerViewController ()

@end

@implementation CntainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self addDrawerController];
    [self addChildController];
    
}


- (void)addDrawerController {
    self.drawerVc = [[DrawerViewController alloc] init];
    [self addChildViewController:self.drawerVc];
    [self.view addSubview:self.drawerVc.view];
    self.drawerVc.delegate = self;
    
    NSLog(@"childView = %@",self.drawerVc.view);
}


- (void)addChildController {
    
    DrawerFirstViewController *fir = [[DrawerFirstViewController alloc] init];
    UINavigationController *navFirst = [[UINavigationController alloc] initWithRootViewController:fir];
    
    DrawerSecondViewController *sec = [[DrawerSecondViewController alloc] init];
    UINavigationController *navSecond = [[UINavigationController alloc] initWithRootViewController:sec];
    
    self.viewControllers = @[navFirst,navSecond];
    
    [self addChildViewController:self.drawerVc];
    [self.view addSubview:self.drawerVc.view];
    self.currentVc = navFirst;
    
}

- (void)setCurrentVc:(UIViewController *)currentVc {
    
    if (_currentVc == currentVc) {
        return;
    }
    
    
    //移除旧视图
    [_currentVc willMoveToParentViewController:nil];
    [_currentVc.view removeFromSuperview];
    [_currentVc removeFromParentViewController];
    
    //添加新的自控制器
    _currentVc = currentVc;
    [self addChildViewController:currentVc];
    [self.view addSubview:currentVc.view];
    
}

- (void)openAndClose {
    
    if (_isAnimationing) {
        return;
    }
    
    [UIView animateWithDuration:0.15 animations:^{
        _isAnimationing = YES;
        if (!_isOpen) {
            self.currentVc.view.transform = CGAffineTransformMakeTranslation(180, 0);
        } else {
            
            self.currentVc.view.transform = CGAffineTransformIdentity;
        }
        
    } completion:^(BOOL finished) {
        _isOpen = !_isOpen;
        _isAnimationing = NO;
        self.currentVc = self.viewControllers[self.controllerIndex];
    }];
}

- (void)adddPanGesture {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:pan];
}

- (void)panGesture:(UIPanGestureRecognizer *)panGesture {
    [self openAndClose];
}

- (void)DrawerViewController:(DrawerViewController *)vc selectedIndex:(NSInteger)index {
    [self openAndClose];
    self.controllerIndex = index;
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
