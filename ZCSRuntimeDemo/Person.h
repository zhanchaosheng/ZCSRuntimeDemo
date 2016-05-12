//
//  Person.h
//  ZCSRuntimeDemo
//
//  Created by Cusen on 16/5/13.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Father.h"

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) double height;
@property (nonatomic, assign) int age;
// 属性是一个对象
@property (nonatomic,strong) Father *father;
// 属性是一个数组
@property (nonatomic,strong) NSArray *sons;
@end
