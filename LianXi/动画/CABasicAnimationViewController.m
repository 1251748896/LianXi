//
//  CABasicAnimationViewController.m
//  LianXi
//
//  Created by Mac on 17/4/26.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "CABasicAnimationViewController.h"

@interface CABasicAnimationViewController ()

@end

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _testView = [[UIView alloc] init];
    _testView.frame = CGRectMake(50, 50, 80, 80);
    _testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_testView];
    
    [self test1];
}

- (void)test1 {
    //1.创建动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.toValue = @(300);
    basicAnimation.duration = 5.0;
    [self.view.layer addAnimation:basicAnimation forKey:@"animation2"];
    //还有一些属性可以设置
    basicAnimation.repeatCount = 10;
}


//基本动画
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //基本动画其实就是改变视图的位置，类似于我们之前学过的UI动画
    
    //1.创建动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    /*
     
     path可以设置的值：
     
     我们可以通过animationWithKeyPath键值对的方式来改变动画
     
     animationWithKeyPath的值：
     
     transform = 旋转
     
     transform.scale = 比例转换(缩放)
     
     transform.scale.x = 宽的比例转换
     
     transform.scale.y = 高的比例转换
     
     transform.rotation.z = 平面圖的旋转
     
     opacity = 透明度
     
     margin
     
     zPosition
     
     backgroundColor    背景颜色
     
     cornerRadius    圆角
     
     borderWidth
     
     bounds
     
     contents
     
     contentsRect
     
     cornerRadius
     
     frame
     
     hidden
     
     mask
     
     masksToBounds
     
     opacity    闪烁
     
     position
     
     shadowColor
     
     shadowOffset
     
     shadowOpacity
     
     shadowRadius
     
     
     */
    //ps:所有的结构体都继承自NSValue
    basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(150, 150)];
//    basicAnimation.byValue //累加多少值
    basicAnimation.duration = 3.0;
    //一个layer可以添加很多个动画对象
    //所以我们需要给，每一个动画设置一个键(key)
    
    //当核心动画完成的时候,如果我们不做任何设置,那么animation会自动从layer上删除,并且回到动画之前的位置
    //如果我们希望：动画完成之后view保持在动画结束的位置，那么我们需要做一下修改.
//    basicAnimation.removedOnCompletion = NO;//
//    basicAnimation.fillMode = kCAFillModeForwards;//动画结束之后停留的位置
    
    //注意:当动画完成之后，只是视图的layer移动到了我们设置的位置，但是视图本身并没有移动.如果视图添加了点击事件，则还是需要点击原来的位置，才能够触发事件.
    //如果我们希望视图本身也要移动到我们的目标位置那么我们就不要用上面的方法来停留视图,而是使用一个代理
    
    //这里的代理没有协议，叫做隐式代理
    basicAnimation.delegate = self;
    
    [self.testView.layer addAnimation:basicAnimation forKey:@"basic1"];
    
    //动画执行完毕之后，回去的原因：在layer当中有两个属性,1个用来记录layer的实际的所有数据,另一个用来呈现画面，我们看到的界面上的所有视图，都是这个属性的效果。当动画结束的时候。会让第二个属性 = 第一个属性的值，由于在动画过程中，第一个属性并没有变化，所以当动画执行完毕之后，又回到了原来的位置.
    
    
}

#pragma mark - <basicAnimation.delegate>

//动画开始
- (void)animationDidStart:(CAAnimation *)anim {
    
}

//动画结束
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.testView.center = CGPointMake(150, 150);
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
