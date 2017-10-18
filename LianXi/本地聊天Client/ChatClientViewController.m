//
//  ChatClientViewController.m
//  LianXi
//
//  Created by Mac on 17/4/14.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "ChatClientViewController.h"

@interface ChatClientViewController ()

@end

@implementation ChatClientViewController

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

- (IBAction)sendMessgeBtnClick:(id)sender {
}

- (IBAction)linkBtnClick:(id)sender {
}

- (IBAction)pushClick:(id)sender {
    
    FriendsListViewController *vc = [[FriendsListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
