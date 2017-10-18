//
//  IsaTest.m
//  LianXi
//
//  Created by Mac on 17/6/16.
//  Copyright © 2017年 jiangbo. All rights reserved.
//

#import "IsaTest.h"

@implementation IsaTest

- (void)classTest {
    
    // Class是一个指向objc_class（类）结构体的指针，而id是一个指向objc_object（对象）结构体的指针
    //objec_object（对象）中isa指针指向的类结构称为objec_class（该对象的类），其中存放着普通成员变量与对象方法 （“-”开头的方法）
    //objec_class（类）中isa指针指向的类结构称为metaclass（该类的元类），其中存放着static类型的成员变量与static类型的方法 （“+”开头的方法）
    
    
    
}

@end
