//
//  TextStyleViewController.m
//  LianXi
//
//  Created by Mac on 17/4/11.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "TextStyleViewController.h"

@interface TextStyleViewController ()

@property (nonatomic) CAShapeLayer *backLayer;
@property (nonatomic) CAShapeLayer *progressLayer;


@end

@implementation TextStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self performSelector:@selector(sharplayer) withObject:nil afterDelay:0.25];
    
//    [self sharplayer];
    
    /*
    Cirl *vv = [[Cirl alloc] init];
    vv.frame = self.view.bounds;
    vv.backgroundColor = [UIColor clearColor];
    [self.view addSubview:vv];
    */
    /*
    NSString *style = fontStyle();
    
    NSLog(@"hhhh = %@",style);
    
    self.contentLabel.font = [Tools tinFontSize:17];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.text = @"我还得窝囊废 坑我呢复调坑我呢可恢复vkefdionrklbnkern肯vklnrv，engine你让我考虑过呢女快乐的妇女穷公开弱女女人比没男人考虑女的开口道女票44看了给你的额我vi二哥IE哈高科儿女四river而你GV哦我火锅ID妇女会计9个肯定v9pjg(⊙v⊙)嗯孤僻的积分礼品v结过婚了融合贡呢过偶尔我会高配";
     */
}

- (void)sharplayer {
    
    //基本形状
    _backLayer = [CAShapeLayer layer];
    _backLayer.frame = self.view.bounds;
    _backLayer.lineWidth = 30;
    _backLayer.fillColor = nil;
    _backLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    _backLayer.lineCap = kCALineCapRound;
    _backLayer.lineJoin = kCALineCapRound;
    
    //clockwise 是否顺时针绘制
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0) radius:self.view.bounds.size.width/2.0-50 startAngle:-M_PI endAngle:M_PI clockwise:YES];
    
    _backLayer.path = path.CGPath;
    
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.view.bounds;
    _progressLayer.lineWidth = 30;
    _progressLayer.fillColor = nil;
    _progressLayer.strokeColor = [UIColor purpleColor].CGColor;
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineJoin = kCALineCapRound;
    
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0) radius:self.view.bounds.size.width/2.0-50 startAngle:-M_PI_2 endAngle:-M_PI_2 + M_PI_2 clockwise:YES];
    
    _progressLayer.path = path1.CGPath;
    
    
    [self.view.layer addSublayer:_backLayer];
    [self.view.layer addSublayer:_progressLayer];
    
    //动画
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anima.fromValue = [NSNumber numberWithFloat:0.0];
    anima.toValue = [NSNumber numberWithFloat:5.0];
    _progressLayer.strokeEnd = 5.0;
    anima.duration = 5.0;
    [_progressLayer addAnimation:anima forKey:@"anima"];
    
    
}

- (void)loop {
    Cirl *rview = [[Cirl alloc]init];
    [rview initCutomViewWithFrame:CGRectMake(0, 0, 20, 20)];
    [self.view addSubview:rview];
    UIBezierPath *bpath = [UIBezierPath bezierPath];
    //设置起点
    [bpath moveToPoint:CGPointMake(self.view.frame.size.width*0.5, 100)];
    //添加二次贝塞尔曲线，（终端点，控制点）
    [bpath addQuadCurveToPoint:CGPointMake(self.view.frame.size.width*0.5, 300) controlPoint:CGPointMake(self.view.frame.size.width+100, 0)];
    [bpath addQuadCurveToPoint:CGPointMake(self.view.frame.size.width*0.5, 100) controlPoint:CGPointMake(-100, 0)];
    //用来设置线条拐角帽的样式0
    bpath.lineCapStyle = kCGLineCapRound;
    //用来设置两条线连接点的样式
    bpath.lineJoinStyle = kCGLineJoinRound;
    //线宽
    bpath.lineWidth = 5;
    //描点连线
    [[UIColor redColor]setStroke];
    //将终点和起点连接起来，构成闭合曲线
    [bpath closePath];
    
    //关键帧动画，通过属性进行动画参数控制，但是同基础动画不同的是它可以有多个状态控制。可以设置多个属性值，每两个属性中间的补间动画由系统自动完成
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = bpath.CGPath;
    animation.duration = 6;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    [rview.layer addAnimation:animation forKey:nil];
    
    //CAReplicatorLayer是一个容器层-你添加内容到其中让复制图层复制其中内容。如果你把一个单一的形状-在复制层将显示在屏幕上几种形状。可以预先设定复制多少几何图形并且设定副本之间的距离，透明度或颜色都可以发生变化
    CAReplicatorLayer *rl = [CAReplicatorLayer layer];
    //设置颜色
    rl.instanceColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1].CGColor;
    //设置复制最大数
    rl.instanceCount = 40;
    //设置出现的间隔时间
    rl.instanceDelay = 0.2;
    //颜色的渐变值
    rl.instanceRedOffset = -0.01;
    rl.instanceGreenOffset = -0.01;
    rl.instanceAlphaOffset = -0.03;
    [rl addSublayer:rview.layer];
    
    [self.view.layer addSublayer:rl];
}

- (void)changeStyle {
    
}

- (IBAction)changeBtnClick:(id)sender {
    
    __weak typeof(self) weakself = self;
    
    StyleSetViewController *vc = [[StyleSetViewController alloc] init];
    vc.change = ^(NSString *style) {
      weakself.contentLabel.font = [UIFont fontWithName:style size:25];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
