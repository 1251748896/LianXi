//
//  TransitionViewController.h
//  LianXi
//
//  Created by Mac on 17/4/14.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

#import "PushTestViewController.h"
#import "Transitions.h"



@interface TransitionViewController : BaseViewController<CAAnimationDelegate>
{
    NSInteger _imageIndex;
}
@property (weak, nonatomic) IBOutlet UIButton *pushBtn;

@property (nonatomic, strong) UIImageView *testView;
@property (nonatomic, strong) UILabel *indexLabel;


@property (nonatomic, strong) Transitions *transition;

- (IBAction)pushBtnClick:(id)sender;

@end
