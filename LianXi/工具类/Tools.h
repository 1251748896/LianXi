//
//  Tools.h
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/utsname.h>

#import "Masonry.h"

typedef NS_ENUM(NSUInteger, TransitionAnimationType) {
    TransitionAnimationTypeFade = 0,
    TransitionAnimationTypePush = 1,
    TransitionAnimationTypeMoveIn = 2,
    TransitionAnimationTypeReveal = 3,
    TransitionAnimationTypeCube = 4,
    TransitionAnimationTypeSuckEffect = 5,
    TransitionAnimationTypeOglFlip = 6,
    TransitionAnimationTypeRippleEffect = 7,
    TransitionAnimationTypePageCurl = 8,
    TransitionAnimationTypePageUnCurl = 9,
    TransitionAnimationTypeCameraIrisHollowOpen = 10,
    TransitionAnimationTypeCameraIrisHollowClose = 11,
};
//、fade、push、moveIn、reveal、cube、suckEffect、oglFlip、rippleEffect、pageCurl、pageUnCurl、cameraIrisHollowOpen、cameraIrisHollowClose、


NSString * JiangBoTransitionType(TransitionAnimationType type);

NSString * fontStyle(void);

@interface Tools : NSObject



+ (void)compareDateWithEarlyDate:(NSDate *)eDate laterDate:(NSDate *)lDate;

+ (NSString *)sandBoxPath ;
+ (NSMutableArray *)wordStyle ;
+ (UIColor *)tinColor;
+ (UIFont *)tinFontSize:(NSInteger)type;
+ (CGSize)downloadImageSizeWithURL:(id)imageURL;
+ (NSString *)toLower:(NSString *)str ;
+ (NSString *)toUpper:(NSString *)str ;

@end
