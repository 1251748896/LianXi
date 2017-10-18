//
//  NetWork.h
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"


@interface NetWork : NSObject
+ (void)post:(NSMutableDictionary *)dic url:(NSString *)url sucess:(void (^)(id object))sucess failture:(void (^)(id object))failture;

+ (void)get:(NSMutableDictionary *)dic url:(NSString *)url sucess:(void (^)(id object))sucess failture:(void (^)(id object))failture;
@end
