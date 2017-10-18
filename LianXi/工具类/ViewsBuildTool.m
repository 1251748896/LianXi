//
//  ViewsBuildTool.m
//  LianXi
//
//  Created by Mac on 17/6/26.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "ViewsBuildTool.h"

@implementation ViewsBuildTool


+(UIButton *)button:(NSString *)title titleColor:(UIColor *)color layerR:(CGFloat)layerR bgImage:(UIImage *)bgImage bgColor:(UIColor *)bgColor tag:(NSInteger)tag frame:(CGRect)frame {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.layer.cornerRadius = layerR;
    button.layer.masksToBounds = YES;
    [button setBackgroundImage:bgImage forState:UIControlStateNormal];
    button.backgroundColor = bgColor;
    button.tag = tag;
    button.frame = frame;
    
    return button;
}


@end
