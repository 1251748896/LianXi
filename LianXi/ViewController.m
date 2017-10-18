//
//  ViewController.m
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[ListViewController alloc] init]];
    
//    TransitionNavigationController *nav = [[TransitionNavigationController alloc] initWithRootViewController:[[ListViewController alloc] init]];
    
    /*
     
     
     
     */
    
    window.rootViewController = nav;
    
    NSMutableDictionary *ddd = [[NSMutableDictionary alloc] init];
    NSInteger kkk = [[ddd objectForKey:@"klkl"] integerValue];
//    NSLog(@"kkk = %zd",kkk);
    // kkk = 0 ;
    
    //
    CGFloat b = 4.56;
    
    int a = b;
//    NSLog(@"a = %d",a);
    
}


- (void)classTest {
    ProductModel *model1 = [[ProductModel alloc] init];
    if ([model1 isKindOfClass:[ProductModel class]]) {
        NSLog(@"[model1 isKindOfClass:[ProductModel class]] == yes");
        
        NSLog(@"%@",[ProductModel class]);
        
    } else {
        NSLog(@"[model1 isKindOfClass:[ProductModel class]] == no");
    }
    
    ProductModel *model2 = [[ProductModel alloc] init];
    if ([model1 isKindOfClass:[model2 class]]) {
        NSLog(@"[model1 isKindOfClass:[model2 class]] == yes");
        NSLog(@"%@",[model2 class]);
    } else {
        NSLog(@"[model1 isKindOfClass:[model2 class]] == no");
    }
    
    if ([[model1 class] isKindOfClass:[model2 class]]) {
        NSLog(@"[[model1 class] isKindOfClass:[model2 class]] == yes");
    } else {
        NSLog(@"[[model1 class] isKindOfClass:[model2 class]] == no");
    }
}

- (void)blockTest {
    
     __block int a = 100;
    
    
     // 如果在block当中打算改变model的属性，(__block)可以加 ，也可以不加。都可以实现目的
     ProductModel *model = [[ProductModel alloc] init];
     model.productname = @"姜波";
     
     
     void (^block)(void) = ^(void) {
     a = 44;
     model.productname = @"张三";
     };
     
     block();
     
     NSLog(@"a = %d",a);
     NSLog(@"name = %@",model.productname);
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
