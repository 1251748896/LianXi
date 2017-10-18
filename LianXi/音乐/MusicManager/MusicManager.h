//
//  MusicManager.h
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AVFoundation/AVFoundation.h>

@interface MusicManager : NSObject

+ (instancetype)manager;


@property (nonatomic, strong) NSMutableArray *musicArray;
@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong, readonly) AVPlayer *player;
@property (nonatomic, assign, readonly) BOOL player_playing;

- (void)playing;
- (void)pauseing;
- (void)playPrevious;
- (void)playNext;

- (void)playerVolumeWithVolumeFloat:(CGFloat)volumeFloat;
- (void)playerProgressWithProgressFloat:(CGFloat)progressFloat;
- (void)replaceItemWithUrlString:(NSString *)urlString ;

@end
