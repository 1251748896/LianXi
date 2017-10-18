//
//  FriendCircleListCell.h
//  LianXi
//
//  Created by Mac on 17/7/4.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const name = @"name";
static NSString * const header = @"header";
static NSString * const text = @"text";
static NSString * const image = @"image";

@interface FriendCircleListCell : UITableViewCell

@property (nonatomic, strong) UIImageView *userImgaeView;
@property (nonatomic, strong) NSArray *dynamicImages;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *textLLLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *lookCouLabel;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
