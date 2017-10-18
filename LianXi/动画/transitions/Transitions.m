//
//  Transitions.m
//  LianXi
//
//  Created by Mac on 17/4/27.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "Transitions.h"

@implementation Transitions

- (instancetype) initWithNavigationController:(UINavigationController*)nc
{
    self = [super init];
    if (self) {
        nc.delegate= self;
    }
    
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning protocol

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 1.从哪里来的控制器，这里是当前控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 2.要去哪里的控制器，这是是UIViewController
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 3.这个view是包含视图，怎么说呢，几个控制器的view做的动画都是在这里面操作的，
    UIView *containerView = [transitionContext containerView];
    containerView.backgroundColor= [UIColor whiteColor];
    // 3.1要显示必须添加到里面哦
    [containerView addSubview:toVC.view];
    
    //第二种
    CATransition *tran = [[CATransition alloc] init];
    tran.type = @"cube";
    tran.subtype = kCATransitionFromRight;
    
    [containerView.layer addAnimation:tran forKey:@"kkk"];
    
    NSLog(@"fromVC = %@\ntoVC = %@\ncontainerView = %@\nself = %@",fromVC,toVC,containerView,self);
    // 必须一定肯定要调用，用来告诉上下文说已经结束动画了
    [transitionContext completeTransition:YES];
    
    //第一种
    /*
    CGRect fromFrame = fromVC.view.frame;
    CGRect toFrame = toVC.view.frame;
    
    fromFrame.origin.x= -fromFrame.size.width;
    toFrame.origin.x= containerView.frame.size.width;
    [toVC.view setFrame:toFrame];
    toFrame.origin.x= 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                         delay:0
        usingSpringWithDamping:0.6f
         initialSpringVelocity:15
                       options:UIViewAnimationOptionCurveEaseIn
                    animations:^{
                        [fromVC.view setFrame:fromFrame];
                        [toVC.view setFrame:toFrame];
                    } completion:^(BOOL finished) {
                        [transitionContext completeTransition:YES];
                    }];
     
     */
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

#pragma mark - UINavigationControllerDelegate
/**
 * 关键实现这俩个方法 UINavigationControllerOperation包含了push还是pop的信息
 */
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController*)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController*)fromVC
                                                 toViewController:(UIViewController*)toVC {
    return self;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController*)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    
    return nil;
}


@end
