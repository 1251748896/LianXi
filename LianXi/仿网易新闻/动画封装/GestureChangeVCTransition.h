//
//  GestureChangeVCTransition.h
//  LianXi
//
//  Created by Mac on 17/5/4.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GestureConifg)();

typedef NS_ENUM(NSUInteger, MyGestureDirection) {
    //手势方向
    MyGestureDirectionLeft = 0,
    MyGestureDirectionRight = 1,
    MyGestureDirectionUp = 2,
    MyGestureDirectionDown = 3,
};

typedef NS_ENUM(NSUInteger, TransitionType) {
    //转场类型
    TransitionTypePresent = 0,
    TransitionTypeDismiss = 1,
    TransitionTypePush = 2,
    TransitionTypePop = 3,
};


@interface GestureChangeVCTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL jiaohuTransition;
@property (nonatomic, assign) MyGestureDirection direction;
@property (nonatomic, assign) TransitionType type;
/**促发手势present的时候的config，config中初始化并present需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg presentConifg;
/**促发手势push的时候的config，config中初始化并push需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg pushConifg;

/** 给传入的控制器添加手势*/
- (void)addPanGestureForViewController:(UIViewController *)viewController;

@end
