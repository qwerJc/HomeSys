//
//  HttpEngine.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/28.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "HttpEngine.h"

static HttpEngine *engine = nil;

@implementation HttpEngine

+ (HttpEngine *)shareEngine {
    // 最好用self 否则子类调用时会出现错误
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        engine = [super allocWithZone:zone];
    });
    return engine;
}

@end
