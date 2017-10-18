//
//  ARC_TestViewController.h
//  LianXi
//
//  Created by Mac on 17/5/3.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"

#import "People.h"

@interface ARC_TestViewController : BaseViewController

{
    UILabel *_label0;
    __strong UILabel *_label1;
    __weak UILabel *_label2;
    __unsafe_unretained UILabel *_label3;//如果什么都不管，按照正常的alloc init 则会产生“野指针”
}

@end
