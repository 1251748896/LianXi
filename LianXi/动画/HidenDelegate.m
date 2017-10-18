//
//  People.m
//  LianXi
//
//  Created by Mac on 17/4/26.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "HidenDelegate.h"

@implementation HidenDelegate

- (void)run {
    
    ////////////////////////////////////////////////////
    
    //在需要回调eat的时候,毁掉一次.
    if ([self.delegate respondsToSelector:@selector(eat)]) {
        [self.delegate eat];
    }
}

- (void)gongziType:(NSInteger)type {
    
    /*
     
     假设这两种情况得到的钱是一样的，
     
     计算：设提成总金额 = x
     
     160 + 2% X = 150 + 3% X
        
        计算后

           X = 1000
     
     所以：当提成总额大于1000，则每天150+3%划算，
          当提成总额等于1000，两种方式工资相同，
          当提成总额小于1000。则每天160+2%划算
     
     */

}

@end
