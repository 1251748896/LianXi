//
//  WaterFallViewController.m
//  LianXi
//
//  Created by Mac on 17/4/25.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "WaterFallViewController.h"

@interface WaterFallViewController ()

@end

static NSString *const cellIdentifier_jifen = @"cell";

@implementation WaterFallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"瀑布流";
    
//    [self get:@"https://www.scyd360.com/api/Index/index" paramter:@{@"version":@"2"}.mutableCopy success:^(NSDictionary *dic) {
//        
//        NSLog(@"ttt = %@",dic);
//        
//        
//    } failure:^(NSError *error) {
//        
//    }];
    
    [self initializeUserInterface];
}

- (void)initializeUserInterface {
    
    WaterFlowLayout *layout = [[WaterFlowLayout alloc] init];
    layout.delegate = self;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    
}

#pragma mark - waterFlowLayoutDelegate

- (CGFloat)waterFlowLayout:(WaterFlowLayout *)layout heightForItemIndex:(NSUInteger)itemIndex itemWidth:(CGFloat)itemWidth {
    return 100 + arc4random_uniform(150);
}

#pragma mark - UICollectionViewDelegate & DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 40;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    UILabel *label = [cell viewWithTag:10];
    if (label == nil) {
        label = [[UILabel alloc] init];
        
        label.tag = 10;
        label.font = [UIFont systemFontOfSize:25];
        [cell addSubview:label];
    }
    label.frame = cell.bounds;
    label.text = [NSString stringWithFormat:@"你好嘛%zd",indexPath.row];
    
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == 0) {
        
       [self.navigationController popViewControllerAnimated:YES];
    } else {
        JifenStoreViewController *vc = [[JifenStoreViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
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
