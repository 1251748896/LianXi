//
//  RuntimeTest.m
//  LianXi
//
//  Created by Mac on 17/7/11.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "RuntimeTest.h"

@implementation RuntimeTest

-(void)showAge{
    NSLog(@"24");
}
-(void)showName:(NSString *)aName{
    NSLog(@"name is %@",aName);
}
-(void)showSizeWithWidth:(float)aWidth andHeight:(float)aHeight{
    NSLog(@"size is %.2f * %.2f",aWidth, aHeight);
}
-(float)getHeight{
    return 187.5f;
}
-(NSString *)getInfo{
    return @"Hi, my name is Dave Ping, I'm twenty-four years old in the year, I like apple, nice to meet you.";
}



@end
