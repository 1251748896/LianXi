//
//  FatherViewController.h
//  LianXi
//
//  Created by Mac on 17/4/13.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

#import "TTTTTTViewController.h"



@interface FatherViewController : BaseViewController<UIViewControllerTransitioningDelegate>
{
    NSInteger _lastButtonIndex;
}

@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) GestureChangeVCTransition *tttt;

@property (nonatomic, strong) FirstViewController *fir;
@property (nonatomic, strong) SecondViewController *sec;
@property (nonatomic, strong) ThirdViewController *third;




@end
