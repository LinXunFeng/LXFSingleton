//
//  LXFDataTool.m
//  单例设计模式(ARC和非ARC)
//
//  Created by 林洵锋 on 2017/2/10.
//  Copyright © 2017年 林洵锋. All rights reserved.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

#import "LXFDataTool.h"

@implementation LXFDataTool

static id _instance = nil;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (_instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [super allocWithZone:zone];
        });
    }
    return _instance;
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}

+ (instancetype)sharedFileTool {
    return [[self alloc] init];
}


@end
