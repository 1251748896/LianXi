//
//  WaterFlowLayout.m
//  LianXi
//
//  Created by Mac on 17/4/25.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "WaterFlowLayout.h"

@interface WaterFlowLayout()

- (NSInteger)columnCount;
- (CGFloat)columnSpacing;
- (CGFloat)rowSpacing;
- (UIEdgeInsets)edgeInsets;

@end

@implementation WaterFlowLayout

//在初始化第一组的时候，调用一次
- (void)prepareLayout {
    [super prepareLayout];
    
    //在产生新的布局之前，先清空旧的布局
    [self.attributesArray removeAllObjects];
    [self.maxYArray removeAllObjects];
    
    //for循环记录第一行的maxY
    for (int i=0; i<[self columnCount]; i++) {
        [self.maxYArray addObject:@([self edgeInsets].top)];
    }
    
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    for (int i=0; i<itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributesArray addObject:attributes];
    }
}

//每次有新的cell出现的时候都会调用这个方法 array装每个item的attributes
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributesArray;
}

//瀑布流的自定义布局
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //瀑布流界面布局的核心计算
    //自定义瀑布流界面布局的核心代码
    NSInteger __block minHeightColumn = 0;
    CGFloat __block minHeight = [self.maxYArray[minHeightColumn] floatValue];
    
    for (NSNumber *Y in self.maxYArray) {
        CGFloat currentY = [Y floatValue];
        if (minHeight > currentY) {
            minHeight = currentY;
            minHeightColumn = [self.maxYArray indexOfObject:Y];
        }
    }
    
    UIEdgeInsets edgeInsets = [self edgeInsets];
    
    CGFloat width = (CGRectGetWidth(self.collectionView.bounds) - edgeInsets.left - edgeInsets.right - [self columnSpacing]*([self columnCount] - 1)) / [self columnCount];
    CGFloat height = [self.delegate waterFlowLayout:self heightForItemIndex:indexPath.item itemWidth:width];
    
    CGFloat originX = edgeInsets.left + minHeightColumn *(width + [self columnSpacing]);
    CGFloat originY = minHeight + [self rowSpacing];
    if (originY != edgeInsets.top) {
        originY += [self rowSpacing];
    }
    
    attributes.frame = CGRectMake(originX, originY, width, height);
    
    //更新maxY数组
    self.maxYArray[minHeightColumn] = @(CGRectGetMaxY(attributes.frame));
    
    return attributes;
}

//实现可以滚动
- (CGSize)collectionViewContentSize {
    
    NSInteger __block maxHeightColumn = 0;
    CGFloat __block maxHeight = [self.maxYArray[maxHeightColumn] floatValue];
    
    for (NSNumber *Y in self.maxYArray) {
        CGFloat currentY = [Y floatValue];
        if (maxHeight < currentY) {
            maxHeight = currentY;
        }
    }
    return CGSizeMake(0, maxHeight + [self edgeInsets].bottom);
}

- (NSInteger)columnCount {
    if ([self.delegate respondsToSelector:@selector(waterFlowLayoutColumnCount:)]) {
        return [self.delegate waterFlowLayoutColumnCount:self];
    }
    return DefaultColumnCount;
}
- (CGFloat)columnSpacing {
    if ([self.delegate respondsToSelector:@selector(waterFlowLayoutColumnSpacing:)]) {
        return [self.delegate waterFlowLayoutColumnSpacing:self];
    }
    return DefaultColumnSpacing;
}
- (CGFloat)rowSpacing {
    if ([self.delegate respondsToSelector:@selector(waterFlowLayoutRowSpacing:)]) {
        return [self.delegate waterFlowLayoutRowSpacing:self];
    }
    return DefaultRowSpacing;
}
- (UIEdgeInsets)edgeInsets {
    if ([self.delegate respondsToSelector:@selector(waterFlowLayoutEdgeInsets:)]) {
        return [self.delegate waterFlowLayoutEdgeInsets:self];
    }
    return DefaultEdgeInsets;
}


- (NSMutableArray *)attributesArray {
    if (!_attributesArray) {
        _attributesArray = [NSMutableArray array];
    }
    return _attributesArray;
}

- (NSMutableArray *)maxYArray {
    if (!_maxYArray) {
        _maxYArray = [NSMutableArray array];
    }
    return _maxYArray;
}

@end
