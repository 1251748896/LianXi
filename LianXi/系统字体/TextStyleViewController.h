//
//  TextStyleViewController.h
//  LianXi
//
//  Created by Mac on 17/4/11.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"
#import "StyleSetViewController.h"

#import "Cirl.h"

@interface TextStyleViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
- (IBAction)changeBtnClick:(id)sender;

@end
/*
 
 常数名	说明
 M_PI	圆周率（=π）
 M_PI_2	圆周率的１/２（=π/2）
 M_PI_4	圆周率的１/４（=π/4）
 M_1_PI	=1/π
 M_2_PI	=2/π
 M_E	=e
 M_LOG2E	log_2(e)
 M_LOG10E	log_10(e)
 */
