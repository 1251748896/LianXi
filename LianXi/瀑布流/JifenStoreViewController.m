//
//  JifenStoreViewController.m
//  LianXi
//
//  Created by Mac on 17/5/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "JifenStoreViewController.h"

@interface BannerCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *bannerImageView;
@property (nonatomic, strong) UIImageView *store;

- (id)initWithFrame:(CGRect)frame;

@end

@implementation BannerCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (UIImageView *)bannerImageView {
    if (!_bannerImageView) {
        _bannerImageView = [[UIImageView alloc] init];
        _bannerImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.bounds), 170.0);
        [self.contentView addSubview:_bannerImageView];
    }
    return _bannerImageView;
}

@end




@interface JifenStoreViewController ()

@end

@implementation JifenStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat w = CGRectGetWidth(self.view.bounds)/2.0 - 10;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc ] init];
    
    layout.itemSize = CGSizeMake(w, w * 2.1);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 64) collectionViewLayout:layout];
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[GoodsCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    [_collectionView registerClass:[BannerCell class] forCellWithReuseIdentifier:baneer];
    
    
    
    [self datasource];
}

- (void)datasource {
    
    [self get:@"http://192.168.6.63:80/api/Mall/index" paramter:@{} success:^(NSDictionary *dic) {
        NSLog(@"mall = %@",dic);
    } failure:^(NSError *error) {
        
    }];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.dataArray.count;
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.goodsImageView.image = [UIImage imageNamed:@"goods0.png"];
    cell.goodsNameLabel.text = @"自行车";
    cell.priceLabel.text = @"1000";
    cell.submitBtn.backgroundColor = [UIColor lightGrayColor];
    cell.backgroundColor = [UIColor purpleColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"row = %zd",indexPath.row);
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
