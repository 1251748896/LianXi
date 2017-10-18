//
//  LocalModel.h
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseModel.h"

@interface LocalModel : BaseModel<NSCoding>

@property (nonatomic, copy) NSString *alias_id;
@property (nonatomic, copy) NSString *infoid;
@property (nonatomic, copy) NSString *title;

@end
