//
//  NetWork.m
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "NetWork.h"

@implementation NetWork

+ (void)get:(NSMutableDictionary *)dic url:(NSString *)url sucess:(void (^)(id))sucess failture:(void (^)(id))failture
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json", @"application/json",@"text/javascript", nil];
    [manager.requestSerializer setTimeoutInterval:10.f];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    //声明:收到的数据是JSON
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //声明:参数数据是JSON
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager GET:url parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (sucess) {
//            sucess(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败 = %@",error);
    }];
}

+ (void)post:(NSMutableDictionary *)dic url:(NSString *)url sucess:(void (^)(id))sucess failture:(void (^)(id))failture
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json", @"application/json",@"text/javascript", nil];
    [manager.requestSerializer setTimeoutInterval:10.f];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    //声明:收到的数据是JSON
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //声明:参数数据是JSON
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success");
        if (sucess) {
            NSDictionary *d = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            sucess(d);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败 = %@",error);
    }];
}


@end
