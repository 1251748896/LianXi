//
//  XhsVideoPlayer.h
//  LianXi
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>

/**
 设置视频播放填充模式
 */
typedef NS_ENUM(NSInteger,XhsPlayerContentMode) {
    XhsPlayerContentModeResizeFit,//尺寸适合
    XhsPlayerContentModeResizeFitFill,//填充视图
    XhsPlayerContentModeResize,//默认
};

typedef NS_ENUM(NSInteger,XhsPlayerState) {
    XhsPlayerStateFailed,        // 播放失败
    XhsPlayerStateBuffering,     // 缓冲中
    XhsPlayerStatePlaying,       // 播放中
    XhsPlayerStateStopped,        //停止播放
};

@interface XhsVideoPlayer : UIView


@property (nonatomic,strong) AVPlayer *player;

@end
