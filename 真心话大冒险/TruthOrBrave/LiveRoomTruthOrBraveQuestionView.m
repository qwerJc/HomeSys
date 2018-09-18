//
//  LiveRoomTruthOrBraveQuestionView.m
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/9/4.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import "LiveRoomTruthOrBraveQuestionView.h"

@implementation LiveRoomTruthOrBraveQuestionView

- (instancetype)initWithFrame:(CGRect)frame{
    frame.origin.x = 150;
    frame.origin.y = 0;
    frame.size.width = 70;
    frame.size.height = 30;
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.backgroundColor = [UIColor blueColor];
}

@end
