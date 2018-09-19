//
//  LiveRoomTruthOrBraveCountdownTimerView.m
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/9/4.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import "LiveRoomTruthOrBraveCountdownTimerView.h"

@interface LiveRoomTruthOrBraveCountdownTimerView()
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) float countdownTime;
@end

@implementation LiveRoomTruthOrBraveCountdownTimerView

- (instancetype)initWithFrame:(CGRect)frame{
    frame.origin.x = 10;
    frame.origin.y = 0;
    frame.size.width = 220;
    frame.size.height = 90;
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    _countdownTime = 90;
     _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(countdownTimer) userInfo:nil repeats:YES];
}

- (void)countdownTimer{
    _countdownTime -= 0.1;
//    NSLog(@"%f",_countdownTime);
}

@end
