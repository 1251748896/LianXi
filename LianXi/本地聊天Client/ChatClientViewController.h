//
//  ChatClientViewController.h
//  LianXi
//
//  Created by Mac on 17/4/14.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

#import "FriendsListViewController.h"


@interface ChatClientViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *linkBtn;
@property (weak, nonatomic) IBOutlet UITextField *messgeTF;
@property (weak, nonatomic) IBOutlet UIButton *pushBtn;
@property (weak, nonatomic) IBOutlet UITextView *chatListTextView;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
- (IBAction)sendMessgeBtnClick:(id)sender;

- (IBAction)linkBtnClick:(id)sender;
- (IBAction)pushClick:(id)sender;
@end
