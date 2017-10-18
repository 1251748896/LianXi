//
//  JifenStoreViewController.h
//  LianXi
//
//  Created by Mac on 17/5/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"
#import "GoodsCollectionViewCell.h"


static NSString *const cellIdentifier = @"cellList";
static NSString *const baneer = @"bannersss";
static NSString *const navcellIdentifier = @"navggg";


@interface JifenStoreViewController : BaseViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end
