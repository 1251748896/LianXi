//
//  RuntimeTest.h
//  LianXi
//
//  Created by Mac on 17/7/11.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeTest : NSObject
-(void)showAge;
-(void)showName:(NSString *)aName;
-(void)showSizeWithWidth:(float)aWidth andHeight:(float)aHeight;
-(float)getHeight;
-(NSString *)getInfo;
@end
