//
//  EnumTools.m
//  LianXi
//
//  Created by apple on 2017/10/9.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "EnumTools.h"

@implementation EnumTools

+ (NSString *)appKey {
    return @"55c4946300131c11";
}

+ (NSString *)secretKey {
    return @"fLiXrclAJSTs9UkhsMA9pYmsUeVRe278";
}

+ (void)translateWords {
    
    // http://fanyi.youdao.com/openapi.do?keyfrom=<keyfrom>&key=<key>&type=data&doctype=<doctype>&version=1.1&q=要翻译的文本
    
    NSString *url = @"http://fanyi.youdao.com/openapi.do?keyfrom=<keyfrom>&key=<key>&type=data&doctype=<doctype>&version=1.1&q=good";
    
    [NetWork get:@{}.mutableCopy url:url sucess:^(id object) {
        
        
        NSLog(@"你好 = %@",object);
        
    } failture:^(id object) {
        NSLog(@"失败");
    }];
    
}

@end
