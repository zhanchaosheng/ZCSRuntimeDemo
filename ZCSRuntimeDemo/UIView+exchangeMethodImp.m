//
//  UIView+exchangeMethodImp.m
//  ZCSRuntimeDemo
//
//  Created by Cusen on 16/5/12.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import "UIView+exchangeMethodImp.h"
#import <objc/runtime.h>

@implementation UIView (exchangeMethodImp)

+ (void)load {
    //获取原方法和自定义方法
    Method originalMethod = class_getInstanceMethod([self class], @selector(layoutSubviews));
    Method myMethod = class_getInstanceMethod([self class], @selector(zcs_layoutSubviews));
    //交换方法实现
    method_exchangeImplementations(originalMethod, myMethod);
}

- (void)zcs_layoutSubviews {
    //先调用类的原方法，以兼容子类重写layoutSubviews的情况
    [self zcs_layoutSubviews];
    //do shomthing...
}
@end
