//
//  DrawerViewController.h
//  LianXi
//
//  Created by Mac on 17/4/24.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"


@class DrawerViewController;

@protocol DrawerViewControllerDeleagte <NSObject>

- (void)DrawerViewController:(DrawerViewController *)vc selectedIndex:(NSInteger)index;

@end

@interface DrawerViewController : BaseViewController



@property (nonatomic, strong, readonly) NSMutableArray *itemTextArray;
@property (nonatomic, weak) id<DrawerViewControllerDeleagte>delegate;


@end
