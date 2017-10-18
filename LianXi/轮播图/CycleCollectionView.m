//
//  CycleCollectionView.m
//  LianXi
//
//  Created by apple on 2017/10/11.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "CycleCollectionView.h"

@interface JBCycleCollectionViewCell : UICollectionViewCell

@property (nonatomic) UIImageView *imageView;

@end

@implementation JBCycleCollectionViewCell

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = self.contentView.frame;
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

@end


@interface CycleCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end


static NSString *const cellIdentifier = @"cell";

@implementation CycleCollectionView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor clearColor];
        
        [self registerClass:[JBCycleCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JBCycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
