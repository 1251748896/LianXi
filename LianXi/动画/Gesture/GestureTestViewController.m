//
//  GestureTestViewController.m
//  LianXi
//
//  Created by Mac on 17/5/3.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "GestureTestViewController.h"

@interface GestureTestViewController ()

@end

@implementation GestureTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _images = [NSMutableArray array];
    
    for (int i=1; i<9; i++) {
        
        NSString *weibu = i<=2? @"jpg":@"jpeg";
        
        NSString *name = [NSString stringWithFormat:@"%d.%@",i,weibu];
        
        [_images addObject:name];
        
    }
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = CGRectMake(20, 50, CGRectGetWidth(self.view.bounds) - 40, CGRectGetHeight(self.view.bounds) - 150);
    self.imageView.image = [UIImage imageNamed:@"1.jpg"];
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    
    MyGestureType typep = MyGestureTypePin;
    
    switch (typep) {
        case MyGestureTypePin:
            [self pinchGestureRecognizer];
            break;
        case MyGestureTypePan:
            [self panGestureTecognizer];
            break;
        case MyGestureTypeSwipe:
            [self swipeGestureRecognizer];
            break;
        case MyGestureTypeLongPress:
            [self longPressGestureRecognizer];
            break;
        case MyGestureTypeTap:
            [self tapGestureRecognizer];
            break;
        case MyGestureTypeRoTation:
            [self rotationGestureRecognizer];
            break;
        case MyGestureTypeScreenEdgePan:
            [self screenEdgePanGestureRecognizer];
            break;
            
        default:
            break;
    }
    
    _changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _changeBtn.frame = CGRectMake(100, 0, 100, 44);
    _changeBtn.backgroundColor = [UIColor purpleColor];
    [_changeBtn addTarget:self action:@selector(changeGeture:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_changeBtn];
    
}

- (void)changeGeture:(UIButton *)button {
    
    static NSUInteger typeppp = 1;
    
    typeppp ++;
    
    if (typeppp > 6) {
        typeppp = 1;
    } else if (typeppp < 1) {
        typeppp = 6;
    }
    
    
    switch (typeppp) {
        case MyGestureTypePin:
            [self pinchGestureRecognizer];
            NSLog(@"当前是:捏合");
            break;
        case MyGestureTypePan:
            [self panGestureTecognizer];
            NSLog(@"当前是:拖拽");
            break;
        case MyGestureTypeSwipe:
            [self swipeGestureRecognizer];
            NSLog(@"当前是:清扫");
            break;
        case MyGestureTypeLongPress:
            [self longPressGestureRecognizer];
            NSLog(@"当前是:长按");
            break;
        case MyGestureTypeTap:
            [self tapGestureRecognizer];
            NSLog(@"当前是:轻拍");
            break;
        case MyGestureTypeRoTation:
            [self rotationGestureRecognizer];
            NSLog(@"当前是:旋转");
            break;
        case MyGestureTypeScreenEdgePan:
            [self screenEdgePanGestureRecognizer];
            NSLog(@"当前是:边缘pan");
            break;
            
        default:
            break;
    }
}


#pragma 轻怕手势
//创建轻拍手势
-(void)tapGestureRecognizer
{
    
    //创建手势对象
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self     action:@selector(tapAction:)];
    //配置属性
    //轻拍次数
    tap.numberOfTapsRequired =1;
    //轻拍手指个数
    tap.numberOfTouchesRequired =1;
    //讲手势添加到指定的视图上
    [_imageView addGestureRecognizer:tap];
    
}

//轻拍事件

-(void)tapAction:(UITapGestureRecognizer *)tap
{
    
    //图片切换
    NSLog(@"拍一下");
    _index ++;
    if (_index == 8) {
        _index = 1;
    }
    self.imageView.image =[UIImage imageNamed:_images[_index]];
    
}
#pragma 清扫手势

//清扫手势
-(void)swipeGestureRecognizer
{
    
    UISwipeGestureRecognizer *swipe =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    //配置属性
    //一个清扫手势  只能有两个方向(上和下) 或者 (左或右)
    //如果想支持上下左右清扫  那么一个手势不能实现  需要创建两个手势
    swipe.direction =UISwipeGestureRecognizerDirectionLeft;
    //添加到指定视图
    [_imageView addGestureRecognizer:swipe];
    UISwipeGestureRecognizer *swipe2 =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    swipe2.direction =UISwipeGestureRecognizerDirectionRight;
    [_imageView addGestureRecognizer:swipe2];
    
}
//清扫事件
-(void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    
    NSLog(@"扫一下");
    if (swipe.direction ==UISwipeGestureRecognizerDirectionRight)       {
        NSLog(@"右清扫");
        _index --;
        if (_index < 1) {
            _index =7;
        }
        _imageView.image =[UIImage imageNamed:_images[_index]];
    }else if(swipe.direction == UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"左扫一下");
        _index ++;
        if (_index == 8) {
            _index=1;
        }
        _imageView.image =[UIImage imageNamed:_images[_index]];
    }
    
}
#pragma 长按手势
//创建长按手势
-(void)longPressGestureRecognizer
{
    
    UILongPressGestureRecognizer *longPress =[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)];
    //最短长按时间
    longPress.minimumPressDuration =2;
    //允许移动最大距离
    longPress.allowableMovement =1;
    //添加到指定视图
    [_imageView addGestureRecognizer:longPress];
    
}
//长按事件
-(void)longPressAction:(UILongPressGestureRecognizer *)longPress
{
    
    //NSLog(@"长按");
    //对于长安有开始和 结束状态
    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"长按开始");
        //将图片保存到相册
//        UIImage *image =[UIImage imageNamed:_images[_index]];
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }else if (longPress.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"长按结束");
    }
    
}

#pragma 平移手势
//创建平移手势
-(void)panGestureTecognizer
{
    
    UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    //添加到指定视图
    [_imageView addGestureRecognizer:pan];
    
}
//创建平移事件
-(void)panAction:(UIPanGestureRecognizer *)pan
{
    
    //获取手势的位置
    CGPoint position =[pan translationInView:_imageView];
    
    //通过stransform 进行平移交换
    _imageView.transform = CGAffineTransformTranslate(_imageView.transform, position.x, position.y);
    //将增量置为零
    [pan setTranslation:CGPointZero inView:_imageView];
    
}




#pragma 捏合手势
-(void)pinchGestureRecognizer {
    UIPinchGestureRecognizer *pinch =[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
    //添加到指定视图
    [_imageView addGestureRecognizer:pinch];
    
}
//添加捏合事件
-(void)pinchAction:(UIPinchGestureRecognizer *)pinch {
    NSLog(@"pinch.scale = %f",pinch.scale);
    //通过 transform(改变) 进行视图的视图的捏合
    _imageView.transform =CGAffineTransformScale(_imageView.transform, pinch.scale, pinch.scale);
    //设置比例 为 1
    pinch.scale = 1;
}

#pragma 旋转手势

//创建旋转手势
-(void)rotationGestureRecognizer
{
    
    UIRotationGestureRecognizer *rotation =[[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationAction:)];
    //添加到指定的视图
    [_imageView addGestureRecognizer:rotation];
    
}
//旋转事件

-(void)rotationAction:(UIRotationGestureRecognizer *)rote
{
    
    //通过transform 进行旋转变换
    _imageView.transform = CGAffineTransformRotate(_imageView.transform, rote.rotation);
    //将旋转角度 置为 0
    rote.rotation = 0;
    
}
#pragma 边缘手势

//创建边缘手势
-(void)screenEdgePanGestureRecognizer
{
    
    UIScreenEdgePanGestureRecognizer *screenPan = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(screenPanAction:)];
    [_imageView addGestureRecognizer:screenPan];
    
}
//创建边缘事件
-(void)screenPanAction:(UIScreenEdgePanGestureRecognizer *)screenPan
{
    
    NSLog(@"边缘");
    
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
