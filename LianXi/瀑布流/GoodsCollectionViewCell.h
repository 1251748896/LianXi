//
//  GoodsCollectionViewCell.h
//  LianXi
//
//  Created by Mac on 17/5/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *goodsImageView;
@property (nonatomic, strong) UILabel *priceLabel, *goodsNameLabel;
@property (nonatomic, strong) UIButton *submitBtn;


- (id)initWithFrame:(CGRect)frame;

@end
