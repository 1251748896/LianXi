//
//  DuoTaiViewController.m
//  LianXi
//
//  Created by apple on 2017/9/19.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "DuoTaiViewController.h"
#import "Peoples.h"
#import "Horse.h"
#import "Animal.h"
@interface DuoTaiViewController ()

@end

@implementation DuoTaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Animal *p = [[Peoples alloc] init];
    
    Animal *h = [[Horse alloc] init];
    
    [p sayHello];
    [h sayHello];
    
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
