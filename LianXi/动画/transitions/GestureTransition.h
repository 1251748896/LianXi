//
//  GestureTransition.h
//  LianXi
//
//  Created by Mac on 17/4/28.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, XWNaviOneTransitionType) {
    XWNaviOneTransitionTypePush = 0,
    XWNaviOneTransitionTypePop
};

//可交互的转场动画
@interface GestureTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) XWNaviOneTransitionType type;

//根据定义的枚举初始化的两个方法
+ (instancetype)transitionWithType:(XWNaviOneTransitionType)type;
- (instancetype)initWithTransitionType:(XWNaviOneTransitionType)type;

@end
