//
//  LocalModel.m
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "LocalModel.h"

@implementation LocalModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.alias_id = [aDecoder decodeObjectForKey:@"alias_id"];
        self.infoid = [aDecoder decodeObjectForKey:@"infoid"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.alias_id forKey:@"alias_id"];
    [aCoder encodeObject:self.infoid forKey:@"infoid"];
}

@end
