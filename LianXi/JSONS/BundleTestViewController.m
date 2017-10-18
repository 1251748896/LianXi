//
//  BundleTestViewController.m
//  LianXi
//
//  Created by Mac on 17/6/22.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BundleTestViewController.h"

@interface BundleTestViewController ()

@end

@implementation BundleTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // ~/Library/Developer/Xcode/UserData/CodeSnippets
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 100, 200, 30);
    label.text = @"你好吗";
    label.textColor = [UIColor blueColor];
    label.font = [Tools tinFontSize:17];
    [self.view addSubview:label];
    
    NSObject *obj = [[NSObject alloc] init];
    
//    obj.name = @"lll";
    
    
    /*
    RuntimeTest *runT = [[RuntimeTest alloc] init];
    ((void (*) (id, SEL)) objc_msgSend) (objct, sel_registerName("showAge"));
    ((void (*) (id, SEL, NSString *)) objc_msgSend) (objct, sel_registerName("showName:"), @"Dave Ping");
    ((void (*) (id, SEL, float, float)) objc_msgSend) (objct, sel_registerName("showSizeWithWidth:andHeight:"), 110.5f, 200.0f);
    float f = ((float (*) (id, SEL)) objc_msgSend_fpret) (objct, sel_registerName("getHeight"));
    NSLog(@"height is %.2f",f);
    NSString *info = ((NSString* (*) (id, SEL)) objc_msgSend) (objct, sel_registerName("getInfo"));
    NSLog(@"%@",info);
    
    */
    
    
//    Method kkk = class_getClassMethod(self, <#SEL name#>)
    
    
}

- (void)arrayTest {
    NSArray *oldArr = @[@"1",@"1",@"2",@"2",@"3",@"3",@"4",];
    //去除数组中重复的对象
    NSArray *newArr = [oldArr valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSLog(@"newArr = %@",newArr);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"dushihuayuanmeng" ofType:@"txt"];
    
    
    NSError *err = nil;
    
    NSLog(@"");
    
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
    
    
    NSLog(@"str = %@",str);
    
    if (err) {
        NSLog(@"err = %@",err);
    }
    
    
    
    
//    NSArray *array = [NSArray arrayWithContentsOfFile:path];
//    NSLog(@"array = %@",array);
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
