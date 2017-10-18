//
//  WaterFallViewController.h
//  LianXi
//
//  Created by Mac on 17/4/25.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"
#import "WaterFlowLayout.h"

#import "JifenStoreViewController.h"

@interface WaterFallViewController : BaseViewController<UICollectionViewDelegate,UICollectionViewDataSource,WaterFlowLayoutDelegate>


@property (nonatomic, strong) UICollectionView *collectionView;


@end
