//
//  RootViewController.m
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    LocalizationViewController *local = [[LocalizationViewController alloc] init];
    UINavigationController *localNav = [[UINavigationController alloc] initWithRootViewController:local];
    TextStyleViewController *style = [[TextStyleViewController alloc] init];
    UINavigationController *styleNav = [[UINavigationController alloc] initWithRootViewController:style];
    
    MusicsListViewController *music = [[MusicsListViewController alloc] init];
    UINavigationController *musicNav = [[UINavigationController alloc] initWithRootViewController:music];
    VideoListViewController *video = [[VideoListViewController alloc] init];
    UINavigationController *videoNav = [[UINavigationController alloc] initWithRootViewController:video];
    
    self.viewControllers = @[localNav,styleNav,musicNav,videoNav];
    NSArray *titles = @[@"缓存",@"字体",@"音乐",@"视频"];
    NSArray *imageNames = @[@"mainNormal.png",@"manageMoneyNormal.png",@"moreNormal.png",@"personalHigh.png"];
    NSArray *imageSelectedNames = @[@"mainHigh.png",@"manageMoneyHigh.png",@"moreHigh.png",@"personalNormal.png"];
    
    for (int i=0; i<self.viewControllers.count; i++) {
        UINavigationController *nav = self.viewControllers[i];
        UIImage *image = [UIImage imageNamed:imageNames[i]];
        UIImage *selectedImage = [UIImage imageNamed:imageSelectedNames[i]];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titles[i] image:image selectedImage:selectedImage];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x448bfc)} forState:UIControlStateSelected];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithWhite:0.0 alpha:1.0]} forState:UIControlStateNormal];
        nav.tabBarItem = item;
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
