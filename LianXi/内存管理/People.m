//
//  People.m
//  LianXi
//
//  Created by Mac on 17/5/8.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "People.h"

@implementation People

- (void)notification {
    
    NSLog(@"添加成功");
    
    NSNotificationCenter *ccc = [NSNotificationCenter defaultCenter];
    
    [ccc addObserver:self selector:@selector(hahaha) name:@"123456" object:nil];
    
    
    
    
}

- (void)hahaha {
    NSLog(@"kkkkkk");
}

- (void)hahaha:(NSNotification *)notification {
    NSLog(@"收到通知了, = %@",notification);
}






/*
 
 //  float height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];     //此方法获取webview的内容高度，但是有时获取的不完全
 //  float height = [webView sizeThatFits:CGSizeZero].height; //此方法获取webview的高度
 float height = [[webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.scrollHeight"]floatValue]; //此方法获取webview的内容高度（建议使用）
 
 */





@end
