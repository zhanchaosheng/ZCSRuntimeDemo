//
//  NSObject+AssociatedObject.m
//  ZCSRuntimeDemo
//
//  Created by Cusen on 16/5/12.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>

char varKey;

@implementation NSObject (AssociatedObject)

- (void)setAssociatedVarName:(NSString *)associatedVarName {
    objc_setAssociatedObject(self, &varKey, associatedVarName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)associatedVarName {
    return objc_getAssociatedObject(self, &varKey);
}
@end
