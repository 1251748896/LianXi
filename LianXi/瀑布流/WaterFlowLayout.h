//
//  WaterFlowLayout.h
//  LianXi
//
//  Created by Mac on 17/4/25.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSInteger const DefaultColumnCount = 3;//列数
static CGFloat const DefaultColumnSpacing = 10.0;//列间距
static CGFloat const DefaultRowSpacing = 10.0;//行间距
static UIEdgeInsets const DefaultEdgeInsets = {10,10,10,10};//

@class WaterFlowLayout;

//编写delegate来返回灵活的以上数据
@protocol WaterFlowLayoutDelegate <NSObject>

@required
//返回每个item高度
- (CGFloat)waterFlowLayout:(WaterFlowLayout *)layout heightForItemIndex:(NSUInteger)itemIndex itemWidth:(CGFloat)itemWidth;

@optional
- (NSInteger)waterFlowLayoutColumnCount:(WaterFlowLayout *)layout;
- (CGFloat)waterFlowLayoutColumnSpacing:(WaterFlowLayout *)layout;
- (CGFloat)waterFlowLayoutRowSpacing:(WaterFlowLayout *)layout;
- (UIEdgeInsets)waterFlowLayoutEdgeInsets:(WaterFlowLayout *)layout;


@end



@interface WaterFlowLayout : UICollectionViewLayout

@property (nonatomic, strong) NSMutableArray *attributesArray;
@property (nonatomic, strong) NSMutableArray *maxYArray;//存放每一列当前的长度
@property (nonatomic, weak) id<WaterFlowLayoutDelegate>delegate;


@end
