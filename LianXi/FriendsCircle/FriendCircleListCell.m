//
//  FriendCircleListCell.m
//  LianXi
//
//  Created by Mac on 17/7/4.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "FriendCircleListCell.h"

@interface FriendImageView : UIImageView

@property (nonatomic, assign) NSInteger jjj;

@end

@implementation FriendImageView

@end






@implementation FriendCircleListCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initializeUserInterface];
    }
    return self;
}

- (void)initializeUserInterface {
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat left = 15.0;
    CGFloat top = 15.0;
    
    [self.userImgaeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(left);
        make.top.equalTo(self.contentView.mas_top).offset(top);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(44);
    }];
    self.userImgaeView.layer.cornerRadius = 44/2.0;
    self.userImgaeView.layer.masksToBounds = YES;
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userImgaeView.mas_right).offset(10);
        make.bottom.equalTo(self.userImgaeView.mas_centerY).offset(-5);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.bottom.equalTo(self.userImgaeView.mas_centerY).offset(5);
    }];
    
    [self.textLLLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userImgaeView.mas_right);
        make.top.equalTo(self.userImgaeView.mas_bottom).offset(15);
        make.width.mas_equalTo(screenW-left*2);
    }];
    
    
}

#pragma mark - <images(创建+赋值+定义图片位置)>

- (void)setDynamicImages:(NSArray *)dynamicImages {
    _dynamicImages= dynamicImages;
    
    //移除
    /*
     isKindOfClass:确定一个对象是否是一个类的成员,或者是派生自该类的成员.
     isMemberOfClass:确定一个对象是否是当前类的成员.
     */
    for (id im in self.contentView.subviews) {
        if ([im isMemberOfClass:[FriendImageView class]]) {
            [im removeFromSuperview];
        }
    }
    
    //创建
    //1.确定图片宽度+高度
    
    CGFloat imageViewW = 0.0;
    CGFloat imageViewH = 0.0;
    if (dynamicImages.count <= 3) {
        imageViewW = CGRectGetWidth(self.textLLLabel.bounds)/dynamicImages.count;
        imageViewH = imageViewW;
        if (dynamicImages.count == 1) {
            CGSize size = [self getImageSizeWithURL:dynamicImages[0]];
            CGFloat bl = size.height/size.width;
            imageViewH = imageViewW * bl;
        }
        
    } else if (dynamicImages.count == 4) {
        imageViewW = CGRectGetWidth(self.textLLLabel.bounds)/2.0;
        imageViewH = imageViewW;
    } else {
        imageViewW = CGRectGetWidth(self.textLLLabel.bounds)/3.0;
        imageViewH = imageViewW;
    }
    
    //必须用约束,frame 很难
//    CGFloat y_min = CGRectGetMaxY(self.textLLLabel.frame);
    
    FriendImageView *lastImageView = nil;
    CGFloat d = 5.0;
    //创建imageView
    for (int i=0; i<dynamicImages.count; i++) {
        FriendImageView *vi = [[FriendImageView alloc] init];
        vi.image = [UIImage imageNamed:dynamicImages[i]];
        [self.contentView addSubview:vi];
        
        //定义布局
        
        if (lastImageView == nil) {
            //第一个view
            [vi mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.textLLLabel.mas_left);
                make.top.equalTo(self.textLLLabel.mas_bottom).offset(20);
                make.width.mas_equalTo(imageViewW);
                make.height.mas_equalTo(imageViewH);
            }];
        }
        
        if (dynamicImages.count <= 3) {
            //只有1排，且最多3个
            
            if (lastImageView) {
                
                [vi mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(lastImageView.mas_right).offset(d);
                    make.top.equalTo(lastImageView.mas_top);
                    make.width.mas_equalTo(imageViewW);
                    make.height.mas_equalTo(imageViewH);
                }];
            }
            
            
        } else if (dynamicImages.count == 4) {
            
            //2排，每排2个
            if (lastImageView) {
                
                if (i == 1 || i == 3) {
                    //不换行
                    [vi mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(lastImageView.mas_right).offset(d);
                        make.top.equalTo(lastImageView.mas_top);
                        make.width.mas_equalTo(imageViewW);
                        make.height.mas_equalTo(imageViewH);
                    }];
                } else {
                    //换行
                    [vi mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(self.textLLLabel.mas_left);
                        make.top.equalTo(lastImageView.mas_bottom).offset(d);
                        make.width.mas_equalTo(imageViewW);
                        make.height.mas_equalTo(imageViewH);
                    }];
                }
            }
            
        } else {
            //最多3排,每排3个
            
            
            
            if (lastImageView == nil) {
                //第一个view
                [vi mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.textLLLabel.mas_left);
                    make.top.equalTo(self.textLLLabel.mas_bottom).offset(20);
                    make.width.mas_equalTo(imageViewW);
                    make.height.mas_equalTo(imageViewH);
                }];
            } else {
                
                if (i == 1 || i == 3) {
                    //不换行
                    [vi mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(lastImageView.mas_right).offset(d);
                        make.top.equalTo(lastImageView.mas_top);
                        make.width.mas_equalTo(imageViewW);
                        make.height.mas_equalTo(imageViewH);
                    }];
                } else {
                    //换行
                    [vi mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(self.textLLLabel.mas_left);
                        make.top.equalTo(lastImageView.mas_bottom).offset(d);
                        make.width.mas_equalTo(imageViewW);
                        make.height.mas_equalTo(imageViewH);
                    }];
                }
                
                
            }
            
        }
        
        
        
        
    }
    
}

#pragma mark - <根据URL获取图片本身的大小>
- (CGSize)getImageSizeWithURL:(id)imageURL {
    NSURL* URL = nil;
    if([imageURL isKindOfClass:[NSURL class]]){
        URL = imageURL;
    }
    if([imageURL isKindOfClass:[NSString class]]){
        URL = [NSURL URLWithString:imageURL];
    }
    if(URL == nil) {
        
        NSLog(@"url不正确");
        return CGSizeZero;                  // url不正确返回CGSizeZero
    }
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    NSString* pathExtendsion = [URL.pathExtension lowercaseString];
    
    CGSize size = CGSizeZero;
    if([pathExtendsion isEqualToString:@"png"]){
        size =  [self getPNGImageSizeWithRequest:request];
    }
    else if([pathExtendsion isEqual:@"gif"])
    {
        size =  [self getGIFImageSizeWithRequest:request];
    }
    else{
        size = [self getJPGImageSizeWithRequest:request];
    }
    if(CGSizeEqualToSize(CGSizeZero, size))                    // 如果获取文件头信息失败,发送异步请求请求原图
    {
        NSData* data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:URL] returningResponse:nil error:nil];
        UIImage* image = [UIImage imageWithData:data];
        if(image)
        {
            size = image.size;
        }
    }
    return size;
}

//  获取PNG图片的大小
- (CGSize)getPNGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 8)
    {
        int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        [data getBytes:&w3 range:NSMakeRange(2, 1)];
        [data getBytes:&w4 range:NSMakeRange(3, 1)];
        int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
        int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
        [data getBytes:&h1 range:NSMakeRange(4, 1)];
        [data getBytes:&h2 range:NSMakeRange(5, 1)];
        [data getBytes:&h3 range:NSMakeRange(6, 1)];
        [data getBytes:&h4 range:NSMakeRange(7, 1)];
        int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
//  获取gif图片的大小
- (CGSize)getGIFImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 4)
    {
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        short w = w1 + (w2 << 8);
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(2, 1)];
        [data getBytes:&h2 range:NSMakeRange(3, 1)];
        short h = h1 + (h2 << 8);
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
//  获取jpg图片的大小
- (CGSize)getJPGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if ([data length] <= 0x58) {
        return CGSizeZero;
    }
    
    if ([data length] < 210) {// 肯定只有一个DQT字段
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        short w = (w1 << 8) + w2;
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        short h = (h1 << 8) + h2;
        return CGSizeMake(w, h);
    } else {
        short word = 0x0;
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
        if (word == 0xdb) {
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
            if (word == 0xdb) {// 两个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            } else {// 一个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
        } else {
            return CGSizeZero;
        }
    }
}


#pragma mark - <imageView>

- (UIImageView *)userImgaeView {
    if (!_userImgaeView) {
        _userImgaeView = [[UIImageView alloc] init];
        [self.contentView addSubview:_userImgaeView];
    }
    return _userImgaeView;
}


#pragma mark -<label>

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLabel];
    }
    return _timeLabel;
}

- (UILabel *)textLLLabel {
    if (!_textLLLabel) {
        _textLLLabel = [[UILabel alloc] init];
        _textLLLabel.numberOfLines = 0;
        [self.contentView addSubview:_textLLLabel];
    }
    return _textLLLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_addressLabel];
    }
    return _addressLabel;
}

- (UILabel *)lookCouLabel {
    if (!_lookCouLabel) {
        _lookCouLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_lookCouLabel];
    }
    return _lookCouLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
