//
//  JJCBlockBtn.m
//  JJCBlockButton
//
//  Created by 贾辰 on 2018/9/26.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "JJCBlockBtn.h"

@interface JJCBlockBtn()
@property (strong, nonatomic) void(^block)(void);
@end

@implementation JJCBlockBtn

- (void)addClickActionBlock:(void(^)(void))actionBlock forControlEvents:(UIControlEvents)controlEvents{
    _block = actionBlock;
    [self addTarget:self action:@selector(onClickAction) forControlEvents:controlEvents];
}

- (void)onClickAction {
    if (_block) {
        _block();
    }
}
@end
