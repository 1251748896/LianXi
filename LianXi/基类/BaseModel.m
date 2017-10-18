//
//  BaseModel.m
//  LianXi
//
//  Created by Mac on 17/4/10.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel


- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self JSON:dic];
    }
    return self;
}

- (void)JSON:(NSDictionary *)dic {
    unsigned int propertycount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertycount);
    NSMutableArray *keysArray = [[NSMutableArray alloc] initWithCapacity:propertycount];
    
    for (int i=0; i<propertycount; i++) {
        objc_property_t property = properties[i];
        
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        [keysArray addObject:propertyName];
        
        if ([dic objectForKey:keysArray[i]] == nil || [[dic objectForKey:keysArray[i]] isEqual:[NSNull null]]) {
            
            [self setValue:@"" forKey:keysArray[i]];
            
        } else {
            if ([[dic objectForKey:keysArray[i]] isKindOfClass:[NSArray class]] || [[dic objectForKey:keysArray[i]] isKindOfClass:[UIImage class]] || [[dic objectForKey:keysArray[i]] isKindOfClass:[NSDictionary class]]) {
                
                [self setValue:[dic objectForKey:keysArray[i]] forKey:keysArray[i]];
            } else {
                [self setValue:[NSString stringWithFormat:@"%@",[dic objectForKey:keysArray[i]]] forKey:keysArray[i]];
            }
        }
        
    }
    free(properties);
}



@end
