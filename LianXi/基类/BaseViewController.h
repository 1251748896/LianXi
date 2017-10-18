//
//  BaseViewController.h
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


- (void)get:(NSString *)url paramter:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^) (NSError *error))failure;
- (void)post:(NSString *)url paramter:(NSDictionary *)dic success:(void (^)(NSDictionary *dic))success failure:(void (^) (NSError *error))failure;

@end
