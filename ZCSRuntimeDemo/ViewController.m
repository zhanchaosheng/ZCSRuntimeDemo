//
//  ViewController.m
//  ZCSRuntimeDemo
//
//  Created by Cusen on 16/5/12.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+JSONExtension.h"
#import "decode.h"
#import "Person.h"
#import "CodeExample.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 字典转模型demo
- (void)json {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"model.json" ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    Person *person = [Person objectWithDict:json];
    
    NSLog(@"%@",person);
}

/// 归解档demo
- (void)archiver {
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"temp.plist"];
    
    CodeExample *archiverObject = [[CodeExample alloc] init];
    
    // 归档
    archiverObject.var1 = @"var1";
    [NSKeyedArchiver archiveRootObject:archiverObject toFile:path];
    
    // 解档
    CodeExample *unarchiverObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"%@",unarchiverObject.var1);
    
    NSLog(@"%@",path);
}
@end
