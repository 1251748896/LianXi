//
//  YDDemoViewController.m
//  LianXi
//
//  Created by apple on 2017/10/9.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "YDDemoViewController.h"
#import "FanYiSDK.h"
#import "EnumTools.h"
@interface YDDemoViewController ()

@end

@implementation YDDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self notOnlineLookupWord];
    
    
//    [self onlineFanyi];
    
}

- (void)apiFanyi {
    
    // http://openapi.youdao.com/api
    
//    NSMutableDictionary *dic = @{@"q":@"你好",@"from":@"zh-CHS",@"to":@"EN",@"appKey":[EnumTools appKey],@"":@""}.mutableCopy;
//    
//    
//    [NetWork get:dic url:@"http://openapi.youdao.com/api" sucess:^(id object) {
//        
//    } failture:^(id object) {
//        
//    }];
    
    
}

- (void)onlineFanyi {
    
    YDTranslateRequest *translateRequest  = [YDTranslateRequest request];
    
    YDTranslateParameters *parameters = [YDTranslateParameters targeting];
    parameters.source = @"youdaosw";
    parameters.from = YDLanguageTypeChinese;
    parameters.to = YDLanguageTypeEnglish;
    translateRequest.translateParameters = parameters;
    
    [translateRequest lookup:@"你好" WithCompletionHandler:^(YDTranslateRequest *request, YDTranslate *response, NSError *error) {
        if (error) {
            //查询失败
            NSLog(@"失败");
        } else {
            //查询成功
            NSLog(@"成功");
        }
        
        NSLog(@"ukPhonetic = %@",response.ukPhonetic);
        
        NSLog(@"usPhonetic = %@",response.usPhonetic);
        NSLog(@"query = %@",response.query);
        NSLog(@"phonetic = %@",response.phonetic);
        NSLog(@"translation = %@",response.translation);
        NSLog(@"explains = %@",response.explains);
        NSLog(@"webExplains = %@",response.webExplains);
        
    }];
    
}

// 这里要崩溃
- (void)notOnlineLookupWord {
    
    // 构造查询器
//    YDHanyucidianOfflineTranslate *offlinetranslate = [YDHanyucidianOfflineTranslate request];
    
    // 执行此初始化方法之后，确保hh文件在指定路径中存在(hh文件可压缩成zip文件后供用户下载，客户端使用之前解压即可)
//    if([offlinetranslate initOfflineWithPath:[XUtil getDownloadPath]]){
//        NSLog(@"离线查词初始化成功");
//    }else{
//        NSLog(@"离线查词初始化失败");
//    }
//    
    //开始查询单词
    
//    [offlinetranslate lookup:@"good" WithCompletionHandler:^(YDHanyucidianOfflineTranslate *request, NSArray *translte, NSError *error) {
//        if (error) {
//            NSString *des = [error.userInfo objectForKey:NSLocalizedDescriptionKey];
//            NSLog(@"================> %ld%@", (long)error.code,des);
//            
//        } else {
//            NSLog(@"translte = %@",translte);
//        }
//    }];
    
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
