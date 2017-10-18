//
//  SocketTestViewController.h
//  LianXi
//
//  Created by Mac on 17/6/28.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseViewController.h"
#import "GCDAsyncSocket.h"

@interface SocketTestViewController : BaseViewController<GCDAsyncSocketDelegate>

@property (nonatomic) GCDAsyncSocket *socket;

@end
