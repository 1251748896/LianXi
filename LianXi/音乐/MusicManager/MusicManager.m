//
//  MusicManager.m
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "MusicManager.h"

@implementation MusicManager

+ (instancetype)manager {
    
    static MusicManager *m = nil;
    static dispatch_once_t onceToken ;
    
    dispatch_once(&onceToken, ^{
        m = [[self alloc] init];
    });
    return m;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _player = [[AVPlayer alloc] init];
    }
    return self;
}

- (void)playing {
    [_player play];
    _player_playing = YES;
}

- (void)pauseing {
    [_player pause];
    _player_playing = NO;
}

- (void)playPrevious
{
    if (self.index == 0) {
        self.index = self.musicArray.count - 1;
    }else{
        self.index--;
    }
}

- (void)playNext
{
    if (self.index == self.musicArray.count - 1) {
        self.index = 0;
    }else{
        self.index++;
    }
}

- (void)replaceItemWithUrlString:(NSString *)urlString {
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    NSLog(@"url = %@",urlString);
    [_player replaceCurrentItemWithPlayerItem:item];
    [self playing];
}

- (void)playerProgressWithProgressFloat:(CGFloat)progressFloat {
    [_player seekToTime:CMTimeMakeWithSeconds(progressFloat, 1) completionHandler:^(BOOL finished) {
        [self playing];
    }];
}

- (void)playerVolumeWithVolumeFloat:(CGFloat)volumeFloat {
    _player.volume = volumeFloat;
}

@end
