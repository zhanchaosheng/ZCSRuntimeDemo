//
//  decode.h
//  ZCSRuntimeDemo
//
//  Created by Cusen on 16/5/12.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import "NSObject+decodeAndEncode.h"

// 需要归解档的对象中添加以下宏

#define ZCS_CODING_IMPLEMENTATION \
- (instancetype)initWithCoder:(NSCoder *)aDecoder {\
if (self = [super init]) {\
[self decode:aDecoder];\
}\
return self;\
}\
\
- (void)encodeWithCoder:(NSCoder *)aCoder {\
[self encode:aCoder];\
}
