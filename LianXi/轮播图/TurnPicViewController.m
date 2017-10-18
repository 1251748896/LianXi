//
//  TurnPicViewController.m
//  LianXi
//
//  Created by apple on 2017/10/11.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "TurnPicViewController.h"
#import "CycleCollectionView.h"

@interface TurnPicViewController ()

@end

@implementation TurnPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UICollectionViewLayout *layout = [[UICollectionViewLayout alloc] init];
    CycleCollectionView *myScrol = [[CycleCollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 270.0) collectionViewLayout:layout];
    
//    myScrol.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 270.0);
    
    myScrol.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:myScrol];
    
    
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
