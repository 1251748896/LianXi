//
//  People.h
//  LianXi
//
//  Created by Mac on 17/5/8.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject


- (void)notification;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSString *second;

//@property (nonatomic, copy) NSMutableString *name;

@property (nonatomic, assign) int age;
@property (nonatomic, assign) float high;
@property (nonatomic, assign) float height;
@property (nonatomic, assign) BOOL sex;

@end
