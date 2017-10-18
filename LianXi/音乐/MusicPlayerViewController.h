//
//  MusicPlayerViewController.h
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

#import "MusicManager.h"
#import "MusicListModel.h"








#define kMusicUrl @"http://mobile.ximalaya.com/mobile/others/ca/album/track/5541/true/1/15"

@interface MusicPlayerViewController : BaseViewController
{
    UISlider *_volumeSlider;         //声音控制
    UIButton *_playAndPauseBtn;
}

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UILabel *currentTimeLabel, *totalLabel;
@property (nonatomic) UISlider *progressV;
@property (nonatomic) NSTimer *timer;

@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, assign) NSInteger lastIndex;
@property (nonatomic, assign) CGFloat distance;


+ (instancetype)musicPlayer;

@end
