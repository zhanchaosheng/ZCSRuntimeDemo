//
//  NSObject+decodeAndEncode.m
//  ZCSRuntimeDemo
//
//  Created by Cusen on 16/5/12.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import "NSObject+decodeAndEncode.h"
#import <objc/runtime.h>

@implementation NSObject (decodeAndEncode)

- (void)decode:(NSCoder *)aDecoder {
    // 逐层对父类的属性进行解档
    Class current = [self class];
    while (current && current != [NSObject class]) {
        
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(current, &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            // 如果有实现该方法则调用
            if ([self respondsToSelector:@selector(ignoredVarNames)]) {
                if ([[self ignoredVarNames] containsObject:key]) continue;
            }
            
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
        current = [current superclass];
    }
}

- (void)encode:(NSCoder *)aCoder {
    // 逐层对父类的属性进行归档
    Class current = [self class];
    while (current && current != [NSObject class]) {
        
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            // 如果有实现该方法则调用
            if ([self respondsToSelector:@selector(ignoredVarNames)]) {
                if ([[self ignoredVarNames] containsObject:key]) continue;
            }
            
            id value = [self valueForKeyPath:key];
            [aCoder encodeObject:value forKey:key];
        }
        free(ivars);
        current = [current superclass];
    }
}

@end
