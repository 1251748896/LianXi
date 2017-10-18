//
//  TimerManager.h
//  LianXi
//
//  Created by Mac on 17/7/11.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSString * const TIMER_NOTIFICATION = @"TIMER_NOTIFICATION";

@interface TimerManager : NSObject

/**
 定时器
 */
@property (nonatomic, strong) NSTimer *timer;

+ (id)manager;

@end
