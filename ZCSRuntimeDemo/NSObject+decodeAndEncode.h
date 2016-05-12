//
//  NSObject+decodeAndEncode.h
//  ZCSRuntimeDemo
//
//  Created by Cusen on 16/5/12.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (decodeAndEncode)

- (NSArray *)ignoredVarNames; //需要过滤的变量名，对象如需要不处理一些变量则实现该方法
- (void)decode:(NSCoder *)aDecoder;
- (void)encode:(NSCoder *)aCoder;

@end
