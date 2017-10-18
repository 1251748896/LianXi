//
//  People.h
//  LianXi
//
//  Created by Mac on 17/4/26.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <Foundation/Foundation.h>


//隐式代理demo
@interface NSObject (animationkkk)

- (void)eat;

@end


@interface HidenDelegate : NSObject

@property (nonatomic, weak) id delegate;

- (void)run;
- (void)gongziType:(NSInteger)type;

@end
