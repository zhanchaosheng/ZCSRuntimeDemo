//
//  CodeExample.m
//  ZCSRuntimeDemo
//
//  Created by Cusen on 16/5/13.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import "CodeExample.h"
#import "decode.h"

@implementation CodeExample

// 设置需要忽略的属性
- (NSArray *)ignoredVarNames {
    return @[@"var2"];
}

//ZCS_CODING_IMPLEMENTATION  //使用该宏代替下面的代码

// 在系统方法内来调用我们的方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self encode:aCoder];
}

@end
