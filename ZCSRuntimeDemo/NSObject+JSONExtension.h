//
//  NSObject+JSONExtension.h
//  ZCSRuntimeDemo
//
//  Created by Cusen on 16/5/13.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  字典转模型
 */
@interface NSObject (JSONExtension)

+ (instancetype )objectWithDict:(NSDictionary *)dict;
- (void)setDict:(NSDictionary *)dict;
// 告诉数组中都是什么类型的模型对象
- (NSString *)arrayObjectClass;

@end
