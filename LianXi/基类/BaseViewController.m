//
//  BaseViewController.m
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    NSMutableData *_buffer;
    UIActivityIndicatorView *_loadingView;
    void (^_success)(NSDictionary *dic);
    void (^_failure)(NSError *error);
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //这句话设置颜色，是无效的。不晓得为啥子
//    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    //这句话可以成功设置导航栏为黑色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = NO;
//    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
}

- (void)get:(NSString *)url paramter:(NSDictionary *)dic success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithFrame:self.view.bounds];
    loadingView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    loadingView.backgroundColor = [UIColor whiteColor];
    [loadingView startAnimating];
    [self.view addSubview:loadingView];
    _loadingView = loadingView;
    _success = success;   _failure = failure;
    
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    //拼接参数
    NSMutableString *param = [[NSMutableString alloc]init];
    for (NSString *key in dic) {
        
        NSString *value = [NSString stringWithFormat:@"%@",[dic objectForKey:key]];
        [param appendString:value];
    }
    //把拼接好的参数转化成data
    NSData *data = [param dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    [request setHTTPMethod:@"get"];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}

- (void)post:(NSString *)url paramter:(NSDictionary *)dic success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithFrame:self.view.bounds];
    loadingView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    loadingView.backgroundColor = [UIColor whiteColor];
    [loadingView startAnimating];
    [self.view addSubview:loadingView];
    _loadingView = loadingView;
    
    _success = success;   _failure = failure;
    
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15.0];
    
    //拼接参数
    NSMutableString *param = [[NSMutableString alloc]init];
    NSInteger count = 0;
    for (NSString *key in dic) {
        
        
        
        count ++;
        [param appendString:key];
        [param appendString:@"="];
        NSString *value = [NSString stringWithFormat:@"%@",[dic objectForKey:key]];
        [param appendString:value];
        if (count != dic.count) {
            [param appendString:@"&"];
        }
    }
    [request setTimeoutInterval:15.0];
    //把拼接好的参数转化成data
    NSData *data = [param dataUsingEncoding:NSUTF8StringEncoding];
    // 设置请求包体(往请求数据区添加数据)
    [request setHTTPBody:data];
    // 如果不设置请求方法,请求默认发的是get请求
    [request setHTTPMethod:@"post"];
    [NSURLConnection connectionWithRequest:request delegate:self];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"收到响应");
    [_loadingView startAnimating];
    
    NSLog(@"%@",_loadingView);
    
    _buffer = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"接收数据");
    [_buffer appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"接收完成");
    [_loadingView stopAnimating];
    NSLog(@"%@",_loadingView);
    
    NSError *err = nil;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_buffer options:NSJSONReadingMutableContainers error:&err];
    
    if (err) {
        NSLog(@"errhhh = %@",err);
    }
    
    if (_success) {
        _success(dic);
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"接收失败 : %@",error);
    
    if (error.code == -1001) {
        NSLog(@"连接超时");
    } else {
        NSLog(@"连接错误");
    }
    
    [_loadingView stopAnimating];
    
    if (_failure) {
        _failure(error);
    }
    
}

- (void)dealloc {
    NSLog(@"释放了%@",self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
