//
//  XhsVideoViewController.m
//  LianXi
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "XhsVideoViewController.h"
#import "SBPlayer.h"
#import "Masonry.h"
@interface XhsVideoViewController ()
@property (nonatomic,strong) SBPlayer *player;
@end

@implementation XhsVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //纯代码请用此种方法
    //http://ivi.bupt.edu.cn/hls/cctv1hd.m3u8 直播网址
    //http://download.3g.joy.cn/video/236/60236937/1451280942752_hd.mp4
    //初始化播放器
    self.player = [[SBPlayer alloc]initWithUrl:[NSURL URLWithString:@"ezopen://DAGQQS@open.ys7.com/521368790/1.hd.live"]];
    
    //设置标题=
    [self.player setTitle:@"这是一个标题"];
    //设置播放器背景颜色
    self.player.backgroundColor = [UIColor blackColor];
    //设置播放器填充模式 默认SBLayerVideoGravityResizeAspectFill，可以不添加此语句
    self.player.mode = SBLayerVideoGravityResizeAspectFill;
    //添加播放器到视图
    [self.view addSubview:self.player];
    //约束，也可以使用Frame
    [self.player mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_top);
        make.height.mas_equalTo(@250);
    }];
    
    
    UIButton *paly = [UIButton buttonWithType:UIButtonTypeCustom];
    //    login.layer.borderColor = [UIColor whiteColor].CGColor;
    //    login.layer.borderWidth = 1.0;
    //    [login setBackgroundImage:[Tool imageWithColor:UIColorFromRGB(0x448bfc)] forState:UIControlStateNormal];
    [paly setTitle:@"paly" forState:UIControlStateNormal];
    paly.titleLabel.font = [UIFont systemFontOfSize:19];
    [paly addTarget:self action:@selector(palyClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:paly];
    [paly mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(120);
    }];
     
    
}

- (void)palyClick {
    [self.player stop];
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
