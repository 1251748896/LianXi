//
//  VideoPlayerViewController.m
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "VideoPlayerViewController.h"

@interface VideoPlayerViewController ()

@end

@implementation VideoPlayerViewController

+ (instancetype)videoPlayer {
    static VideoPlayerViewController *v = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        v = [[self alloc] init];
    });
    return v;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
