//
//  FatherViewController.h
//  LianXi
//
//  Created by Mac on 17/4/24.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"
#import "DrawerViewController.h"
#import "DrawerFirstViewController.h"
#import "DrawerSecondViewController.h"

@interface CntainerViewController : BaseViewController<DrawerViewControllerDeleagte>


@property (nonatomic, strong) DrawerViewController *drawerVc;
@property (nonatomic, strong) UIViewController *currentVc;
@property (nonatomic, strong) NSArray *viewControllers;

@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) NSInteger controllerIndex;
@property (nonatomic, assign) BOOL isAnimationing;

- (void)openAndClose;

@end
