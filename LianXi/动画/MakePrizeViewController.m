//
//  MakePrizeViewController.m
//  LianXi
//
//  Created by Mac on 17/4/14.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "MakePrizeViewController.h"

@interface MakePrizeViewController ()

@end

@implementation MakePrizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeUserInterface];
    
}

- (void)initializeUserInterface {
    
    
    
    
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor greenColor];
    bg.bounds = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds)*0.8, CGRectGetWidth(self.view.bounds)*0.8);
    bg.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.jiantouView.frame));
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timg.jpeg"]];
    bg.backgroundColor = color;
    [self.view addSubview:bg];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor yellowColor];
    button.center = bg.center;
    button.bounds = CGRectMake(0, 0, 60, 60);
    button.layer.cornerRadius = 30;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(beginAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.jiantouView.backgroundColor = [UIColor purpleColor];
    //anchorPoint为UIView的中心点，它是一个比例值，默认是CGPointMake(0.5, 0.5)，即视图的中心点在长度、宽度的一半的位置。
    self.jiantouView.layer.anchorPoint = CGPointMake(0.5, 1);
    [self.view bringSubviewToFront:self.jiantouView];
    
}

- (void)beginAnimation:(UIButton *)button {
    NSInteger turnAngle;//8个奖励分别对应的角度
    NSInteger randomNum = arc4random()%100;//控制概率
    NSInteger turnsNum = 4; // arc4random()%5+1;//控制圈数
    
    NSLog(@"圈数 = %ld",(long)turnsNum);
    
    if (randomNum>=0 && randomNum<20) {//80%的概率 就是0-80
        
        if (randomNum < 10) {
            turnAngle = 0;
        }else{
            turnAngle = 135;
        }
//        self.labelText = self.turntable.numberArray[0];
        NSLog(@"抽中了500");
        
    } else if (randomNum>=20 && randomNum<40) {
        
        if (randomNum < 35) {
            turnAngle = 45;
        }else{
            turnAngle = 225;
        }
//        self.labelText = self.turntable.numberArray[3];
        NSLog(@"抽中了鲜花");
        
    } else if (randomNum >=40 && randomNum<60) {
        
        turnAngle = 315;
//        self.labelText = self.turntable.numberArray[1];
        NSLog(@"抽中了2000");
        
    } else if(randomNum >=60 && randomNum<80){
        
        if (randomNum < 75) {
            turnAngle = 90;
        }else{
            turnAngle = 270;
        }
//        self.labelText = self.turntable.numberArray[2];
        NSLog(@"抽中了5000");
        
    }else{
        
        turnAngle = 180;
//        self.labelText = self.turntable.numberArray[4];
        NSLog(@"抽中了20000");
    }
    
    CGFloat perAngle = M_PI/180.0;
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:turnAngle * perAngle + 360 * perAngle * turnsNum];
    rotationAnimation.duration = 3.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.delegate = self;
    //由快变慢
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    rotationAnimation.fillMode=kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    [self.jiantouView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    // 转盘结束后调用，显示获得的对应奖励
//    self.label.text = [NSString stringWithFormat:@"恭喜您抽中%@",self.labelText];
}

- (UIView *)jiantouView {
    if (!_jiantouView) {
        _jiantouView = [[UIView alloc] init];
        _jiantouView.bounds = CGRectMake(0, 0, 2.0, 100);
        _jiantouView.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame) - 50);
        _jiantouView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_jiantouView];
    }
    return _jiantouView;
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
