//
//  DrawerViewController.m
//  LianXi
//
//  Created by Mac on 17/4/24.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "DrawerViewController.h"

@interface DrawerViewController ()

@end

@implementation DrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _itemTextArray = [NSMutableArray array];
    [_itemTextArray addObject:@"first"];
    [_itemTextArray addObject:@"second"];
    
    [self buttonItemConnt:_itemTextArray.count];
    
}

- (void)buttonItemConnt:(NSInteger)c {
    
    
    
    for (int i=0; i<c; i++) {
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        item.frame = CGRectMake(0, 100 + i*(40+10), 180, 40);
        item.backgroundColor = [UIColor orangeColor];
        item.tag = 100 + i;
        [item setTitle:_itemTextArray[i] forState:UIControlStateNormal];
        [item addTarget:self action:@selector(selectedVcItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:item];
    }
}

- (void)selectedVcItem:(UIButton *)button {
    
    [self.delegate DrawerViewController:self selectedIndex:button.tag - 100];
    
    
    if (button.tag == 100) {
        //first
        
        
        
        
    } else if (button.tag == 101) {
        //second
        
        
        
        
    } else if (button.tag == 102) {
        //thrid
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
