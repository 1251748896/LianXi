//
//  GoodsCollectionViewCell.m
//  LianXi
//
//  Created by Mac on 17/5/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "GoodsCollectionViewCell.h"

@implementation GoodsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self UI];
    }
    return self;
}

- (void)UI {
    
    CGFloat imageViewWidth = CGRectGetWidth(self.contentView.bounds) - 20;
    
    self.goodsImageView.frame = CGRectMake(10, 10, imageViewWidth, imageViewWidth*1.5);
    self.priceLabel.frame = CGRectMake(0, CGRectGetMaxY(_goodsImageView.frame) + 15, CGRectGetWidth(self.contentView.bounds), 20);
    self.goodsNameLabel.frame = CGRectMake(0, CGRectGetMaxY(_priceLabel.frame) + 10, CGRectGetWidth(self.contentView.bounds), 20);
    self.submitBtn.bounds = CGRectMake(0, 0, 100, 35);
    self.submitBtn.center = CGPointMake(CGRectGetMidX(self.contentView.frame), CGRectGetMaxY(_goodsNameLabel.frame) + 35.0/2.0 + 10);
    
}

- (void)submitBtnClick {
    
}

- (UIImageView *)goodsImageView {
    if (!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_goodsImageView];
    }
    return _goodsImageView;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = [UIColor orangeColor];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_priceLabel];
    }
    return _priceLabel;
}

- (UILabel *)goodsNameLabel {
    if (!_goodsNameLabel) {
        _goodsNameLabel = [[UILabel alloc] init];
        _goodsNameLabel.textColor = [UIColor blackColor];
        _goodsNameLabel.textAlignment = NSTextAlignmentCenter;
        _goodsNameLabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_goodsNameLabel];
    }
    return _goodsNameLabel;
}

- (UIButton *)submitBtn {
    if (!_submitBtn) {
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitBtn setTitle:@"立即认购" forState:UIControlStateNormal];
        [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_submitBtn];
    }
    return _submitBtn;
}


@end
