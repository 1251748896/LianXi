//
//  ViewsBuildTool.h
//  LianXi
//
//  Created by Mac on 17/6/26.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewsBuildTool : NSObject


+ (UIButton *)button:(NSString *)title titleColor:(UIColor *)color layerR:(CGFloat)layerR bgImage:(UIImage *)bgImage bgColor:(UIColor *)bgColor tag:(NSInteger)tag frame:(CGRect)frame;

@end
