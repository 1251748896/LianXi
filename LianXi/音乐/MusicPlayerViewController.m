//
//  MusicPlayerViewController.m
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "MusicPlayerViewController.h"

@interface MusicPlayerViewController ()

@end

@implementation MusicPlayerViewController


+ (instancetype)musicPlayer {
    static MusicPlayerViewController *p = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        p = [[self alloc] init];
    });
    return p;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _distance = 20;
    [self initializeUserInterface];
    
    [self beginPlay];
}


- (void)initializeUserInterface {
    /*
     ******音乐的后台播放*******
     如果不实现后台播放模式，用户只能够在音乐播放器显示在前台的时候方能听音乐，按home键退到后台后，音乐自动暂停播放。由此可见，作为音乐播放软件，后台播放功能必不可少。
     在工程的plist文件中加入如下字段:
     key:Required background modes
     type:array
     value:App plays audio or streams audio/video using AirPlay
     */
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    //
    UILabel *proLabel = [[UILabel alloc]init];
    proLabel.frame = CGRectMake(_distance, CGRectGetMaxY(self.imageView.frame) + 10, CGRectGetWidth(self.imageView.frame)/2.0, 25);
    proLabel.text = @"进度";
    [self.view addSubview:proLabel];
    
    _progressV = [[UISlider alloc] initWithFrame:CGRectMake(_distance, CGRectGetMaxY(proLabel.frame) + 5, CGRectGetWidth(self.imageView.frame), 20)];
    [_progressV addTarget:self action:@selector(playProgress:)
         forControlEvents:UIControlEventValueChanged];
    _progressV.minimumValue = 0.0f;
    _progressV.maximumValue = 10.0f;
    [self.view addSubview:_progressV];
    
    //
    UILabel *volLabel = [[UILabel alloc]init];
    volLabel.frame = CGRectMake(_distance, CGRectGetMaxY(_progressV.frame) + 10, CGRectGetWidth(self.imageView.frame)/2.0, 25);
    volLabel.text = @"音量";
    [self.view addSubview:volLabel];
    
    _volumeSlider = [[UISlider alloc] initWithFrame:CGRectMake(_distance, CGRectGetMaxY(volLabel.frame) + 5, CGRectGetWidth(self.imageView.frame), 20)];
    [_volumeSlider addTarget:self action:@selector(volumeChange:)
            forControlEvents:UIControlEventValueChanged];
    //设置最小音量
    _volumeSlider.minimumValue = 0.0f;
    //设置最大音量
    _volumeSlider.maximumValue = 10.0f;
    //初始化音量为多少
    _volumeSlider.value = 5.0f;
    [self.view addSubview:_volumeSlider];
    
    //初始化三个button
    _playAndPauseBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_playAndPauseBtn setFrame:CGRectMake(_distance, CGRectGetMaxY(_volumeSlider.frame) + 10, 60, 40)];
    [_playAndPauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
    [_playAndPauseBtn addTarget:self action:@selector(beginOrPausePlay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_playAndPauseBtn];
    
    
    UIButton *stopBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [stopBtn setFrame:CGRectMake(CGRectGetMaxX(_playAndPauseBtn.frame), CGRectGetMinY(_playAndPauseBtn.frame), 60, 40)];
    [stopBtn setTitle:@"停止" forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
    //声音开关控件(静音)
    UISwitch *swith = [[UISwitch alloc] initWithFrame:CGRectMake(CGRectGetMaxX(stopBtn.frame) + 10, CGRectGetMinY(stopBtn.frame), 60, 40)];
    [swith addTarget:self action:@selector(onOrOff:) forControlEvents:UIControlEventValueChanged];
    //默认状态为打开
    swith.on = YES;
    [self.view addSubview:swith];
    
    UIButton *previousBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [previousBtn setFrame:CGRectMake(_distance, CGRectGetMaxY(_playAndPauseBtn.frame), 80, 40)];
    [previousBtn setTitle:@"上一首" forState:UIControlStateNormal];
    [previousBtn addTarget:self action:@selector(previous:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:previousBtn];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [nextBtn setFrame:CGRectMake(CGRectGetMaxX(previousBtn.frame) + 50, CGRectGetMinY(previousBtn.frame), 80, 40)];
    [nextBtn setTitle:@"下一首" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAct) userInfo:nil repeats:YES];
}

- (void)timerAct{
    
    if ([MusicManager manager].player.currentTime.timescale == 0 || [MusicManager manager].player.currentItem.duration.timescale == 0) {
        return;
    }
    // 获得音乐总时长
    long long int totalTime = [MusicManager manager].player.currentItem.duration.value / [MusicManager manager].player.currentItem.duration.timescale;
    // 获得当前时间
    long long int currentTime = [MusicManager manager].player.currentTime.value / [MusicManager manager].player.currentTime.timescale;
    self.currentTimeLabel.text = [NSString stringWithFormat:@"%02lld:%02lld", currentTime / 60, currentTime % 60];
    self.totalLabel.text = [NSString stringWithFormat:@"%02lld:%02lld", totalTime / 60, totalTime % 60];
    _progressV.maximumValue = totalTime;
    _progressV.minimumValue = 0;
    _progressV.value = currentTime;
    
    if (_progressV.value == totalTime) {
        [[MusicManager manager] playNext];
        [self beginPlay];
    }
    
    [UIView beginAnimations:@"rzoration" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, 0.02);
    [UIView commitAnimations];
    
}

- (void)beginOrPausePlay {
    BOOL ing = [MusicManager manager].player_playing;
    
    if (ing == YES) {
        
        [_playAndPauseBtn setTitle:@"播放" forState:UIControlStateNormal];
        [[MusicManager manager] pauseing];
        _timer.fireDate = [NSDate distantFuture];
    } else {
        
        [_playAndPauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
        [[MusicManager manager] playing];
        _timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:1.0];
    }
}


- (void)beginPlay {
    
    self.imageView.transform = CGAffineTransformIdentity;
    NSInteger index = [MusicManager manager].index;
    MusicListModel *model = [MusicManager manager].musicArray[index];
    self.navigationItem.title = model.title;
    
    NSURL *URL = [NSURL URLWithString:model.coverLarge];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    self.imageView.image = [UIImage imageWithData:data];
    
    [[MusicManager manager] replaceItemWithUrlString:model.playUrl32];
}

- (void)pause {
    
}

- (void)stop {
    
}

- (void)previous:(UIButton *)button {
    
    [[MusicManager manager] playPrevious];
    [self beginPlay];
    
}

- (void)next:(UIButton *)button {
    
    [[MusicManager manager] playNext];
    [self beginPlay];
    
}

- (void)playProgress:(UISlider *)sender {
    [[MusicManager manager] playerProgressWithProgressFloat:((UISlider*)sender).value];
}

- (void)volumeChange:(UISlider *)sender {
    
    [[MusicManager manager] playerVolumeWithVolumeFloat:((UISlider*)sender).value];
    
}

- (void)onOrOff:(UISwitch *)swith {
    
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        CGFloat width = CGRectGetWidth(self.view.bounds) - self.distance*2;
        CGFloat height = (width)/1.0;
        _imageView.bounds = CGRectMake(0, 0, width, height);
        _imageView.center = CGPointMake(CGRectGetMidX(self.view.frame), self.distance +height/2.0);
        _imageView.layer.cornerRadius = width/2.0;
        _imageView.clipsToBounds = YES;
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

- (void)dealloc {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
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
