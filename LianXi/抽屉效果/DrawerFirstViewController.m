//
//  DrawerFirstViewController.m
//  LianXi
//
//  Created by Mac on 17/4/24.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "DrawerFirstViewController.h"

@interface DrawerFirstViewController ()

@end

@implementation DrawerFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"first";
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationController.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.navigationController.view.layer.shadowOffset = CGSizeMake(-10, 0);
    self.navigationController.view.layer.shadowOpacity = 0.15;//透明度
    self.navigationController.view.layer.shadowRadius = 10;
    
    UIBarButtonItem *men = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(openCloseMennu:)];
    self.navigationItem.leftBarButtonItem = men;
    
}

- (void)openCloseMennu:(UIBarButtonItem *)item {
    [self.navigationController.parentViewController performSelector:@selector(openAndClose)];
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
