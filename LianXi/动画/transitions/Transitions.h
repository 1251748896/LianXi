//
//  Transitions.h
//  LianXi
//
//  Created by Mac on 17/4/27.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Transitions : UIPercentDrivenInteractiveTransition<UIViewControllerAnimatedTransitioning,UINavigationControllerDelegate>


@property (nonatomic, assign) BOOL animationIng;

- (instancetype) initWithNavigationController:(UINavigationController*)nc;

@end
