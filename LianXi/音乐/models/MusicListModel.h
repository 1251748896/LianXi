//
//  MusicListModel.h
//  LianXi
//
//  Created by Mac on 17/4/12.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseModel.h"

@interface MusicListModel : BaseModel

//lsit
@property (nonatomic, copy) NSString *albumId;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *coverLarge;
@property (nonatomic, copy) NSString *coverMiddle;
@property (nonatomic, copy) NSString *coverSmall;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *duration;
@property (nonatomic, copy) NSString *isPaid;
@property (nonatomic, copy) NSString *isPublic;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *opType;
@property (nonatomic, copy) NSString *playPathAacv164;
@property (nonatomic, copy) NSString *playPathAacv224;
@property (nonatomic, copy) NSString *playPathHq;
@property (nonatomic, copy) NSString *playUrl32;
@property (nonatomic, copy) NSString *playUrl64;
@property (nonatomic, copy) NSString *playtimes;
@property (nonatomic, copy) NSString *processState;
@property (nonatomic, copy) NSString *shares;
@property (nonatomic, copy) NSString *smallLogo;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *trackId;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *userSource;

/*
albumId = 5541;
comments = 151;
coverLarge = "http://fdfs.xmcdn.com/group5/M00/E9/50/wKgDtlSRTOKAX-kQAAPysXnBTpA860_mobile_large.jpg";
coverMiddle = "http://fdfs.xmcdn.com/group5/M00/E9/50/wKgDtlSRTOKAX-kQAAPysXnBTpA860_web_large.jpg";
coverSmall = "http://fdfs.xmcdn.com/group5/M00/E9/50/wKgDtlSRTOKAX-kQAAPysXnBTpA860_web_meduim.jpg";
createdAt = 1418808559000;
duration = 253;
isPaid = 0;
isPublic = 1;
likes = 388;
nickname = "0fancy\U82b30";
opType = 1;
playPathAacv164 = "http://audio.xmcdn.com/group16/M05/1D/4B/wKgDbFV4UYyQGBGyAB9tw0HK9oI870.m4a";
playPathAacv224 = "http://audio.xmcdn.com/group15/M03/0A/1D/wKgDaFVfWX-zp0uSAAwSQBQ4KIs268.m4a";
playPathHq = "";
playUrl32 = "http://audio.xmcdn.com/group5/M00/EA/37/wKgDtVSRS8DT3Bo7AA98QRJYwRc523.mp3";
playUrl64 = "http://audio.xmcdn.com/group5/M06/E9/4B/wKgDtlSRSxmyDUkVAB74Cqf1V0Y663.mp3";
playtimes = 105682;
processState = 2;
shares = 0;
smallLogo = "http://fdfs.xmcdn.com/group15/M01/ED/34/wKgDZVahvZnzZTfGAAHUmJ76ATk845_mobile_small.jpg";
status = 1;
title = "\U4f60\U8d70\U4ee5\U540e \U773c\U6cea\U7ec8\U4e8e\U51b3\U5824\U4e86";
trackId = 4680572;
uid = 1204303;
userSource
 
 */
@end
