//
//  LXFFileTool.m
//  单例设计模式(ARC和非ARC)
//
//  Created by 林洵锋 on 2017/2/10.
//  Copyright © 2017年 林洵锋. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "LXFFileTool.h"

@implementation LXFFileTool

static LXFFileTool *_fileTools = nil;

/**
 *  alloc方法内部会调用allocWithZone:
 *  @param zone 系统分配给app的内存
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (_fileTools == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{    // 安全(这个代码只会被调用一次)
            _fileTools = [super allocWithZone:zone];
        });
    }
    return _fileTools;
}

- (oneway void)release {
    // 在allocWithZone中使用了GCD令创建对象的代码只执行一次，如果_fileTools被释放则无法再创建
    // 重写release方法，防止_fileTools被释放
}

- (instancetype)retain {
    return self;
}

// 重写retainCount锁定引用计数
- (NSUInteger)retainCount {
    return 1;
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _fileTools = [super init];  // init会先调用alloc方法
    });
    return _fileTools;
}

+ (instancetype)sharedFileTool {
    return [[self alloc] init];
}

@end
