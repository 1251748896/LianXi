//
//  ARC_TestViewController.m
//  LianXi
//
//  Created by Mac on 17/5/3.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "ARC_TestViewController.h"

@interface ARC_TestViewController ()

@end

@implementation ARC_TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(labelTestButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self labelTest];
    
    //双指针
    NSString *name = nil;
    NSLog(@"name = %@ ; namep = %p",name,name);
    // & 表示取指针的内存地址
    name = @"张三";
    [self setName:name];
    NSLog(@"name= = yy %@",name);
    [self setAname:&name];
    NSLog(@"name = uuu  %@",name);
    
    //价格线
    NSString *oldPrice = @"¥ 12345213123";
    NSUInteger length = [oldPrice length];
    
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 120, 15)];
      
    [self.view addSubview:label];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:oldPrice];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(2, length-2)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:UIColorFromRGB(0x404040) range:NSMakeRange(2, length-2)];
    [label setAttributedText:attri];
    
    //深拷贝/浅拷贝
    NSMutableString *myname = [NSMutableString stringWithString:@"姜波"];
    NSMutableString *second = [NSMutableString stringWithFormat:@"seconddd"];
    
    People *p = [[People alloc] init];
    p.name = myname;
    p.second = second;
    [myname appendString:@"--急急急"];
    [second appendString:@"--strong"];
    NSLog(@"p.name = %@",p.name);
    NSLog(@"p.second = %@",p.second);
    
}

- (void)setName:(NSString *)aName {
    NSLog(@"aName = %@ ; aName = %p ; &aName = %p",aName,aName,&aName);
    aName = @"王五";
}


- (void)setAname:(NSString **)aName {
    *aName = @"李四";
}

- (void)labelTestButton:(UIButton *)button {
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    //
//    [center postNotificationName:@"jiangbokkk" object:nil];
    
    NSNotification *notification = [NSNotification notificationWithName:@"123456" object:nil userInfo:nil];
    [center postNotification:notification];
    
//    [center postNotificationName:@"123456" object:nil userInfo:nil];
    NSLog(@"发通知");
    
//    NSLog(@"0 = %@",_label0);
//    NSLog(@"1 = %@",_label1);
//    NSLog(@"2 = %@",_label2);
//    NSLog(@"3 = %@",_label3);//由于_label3是野指针，所以如果这里打印_label3，会崩溃.
}

- (void)labelTest {
    _label0 = [[UILabel alloc] init];
    _label1 = [[UILabel alloc] init];
//    _label2 = [[UILabel alloc] init];
//    _label3 = [[UILabel alloc] init];
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
