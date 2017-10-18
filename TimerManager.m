//
//  TimerManager.m
//  LianXi
//
//  Created by Mac on 17/7/11.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "TimerManager.h"

@implementation TimerManager

+ (id)manager {
    
    static TimerManager *m = nil;
    
    static dispatch_once_t onceToken ;
    
    dispatch_once(&onceToken, ^{
        m = [[self alloc] init];
    });
    
    return m;
}

- (void)startTimerWithTimeInterVal:(NSTimeInterval)timeInterVal
{
    if (_timer) return;
    _timer = [NSTimer timerWithTimeInterval:timeInterVal
                                     target:self
                                   selector:@selector(timerAction:)
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer
                              forMode:NSRunLoopCommonModes];
}

/**
 定时器调用事件
 
 @param timer timer
 */
- (void)timerAction:(NSTimer *)timer
{
    [[NSNotificationCenter defaultCenter] postNotificationName:TIMER_NOTIFICATION object:nil userInfo:nil];
}

/**
 结束定时器
 */
- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

@end
