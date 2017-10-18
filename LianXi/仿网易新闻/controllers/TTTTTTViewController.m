//
//  TTTTTTViewController.m
//  LianXi
//
//  Created by Mac on 17/5/4.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "TTTTTTViewController.h"

@interface TTTTTTViewController ()

@end

@implementation TTTTTTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _bbbbb = [[GestureChangeVCTransition alloc] init];
    _bbbbb.type = TransitionTypePop;
    _bbbbb.direction = MyGestureDirectionRight;
    
    [_bbbbb addPanGestureForViewController:self];
    
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
