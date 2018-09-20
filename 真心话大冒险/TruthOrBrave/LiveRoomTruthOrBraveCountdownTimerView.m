//
//  LiveRoomTruthOrBraveCountdownTimerView.m
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/9/4.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import "LiveRoomTruthOrBraveCountdownTimerView.h"
#import "ModelLocator.h"
#import "UIColor+xiuchang_iPhone.h"

// countdownTimer label
static NSInteger const kTruthOrBraveCountdownTimerViewWidth = 50;
static NSInteger const kTruthOrBraveCountdownTimerViewHeight = 18;

// countdownTimer BG
static NSInteger const kTruthOrBraveCountdownTimerBGWidth = 65;
static NSInteger const kTruthOrBraveCountdownTimerBGHeight = 18;
@interface LiveRoomTruthOrBraveCountdownTimerView()
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) int countdownTime;

@property (strong, nonatomic) UILabel *lblContent;
@property (strong, nonatomic) UIImageView *imgvContentBG;
@end

@implementation LiveRoomTruthOrBraveCountdownTimerView

- (instancetype)initWithFrame:(CGRect)frame{
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = SCREEN_WIDTH;
    frame.size.height = 19;
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.backgroundColor = [UIColor grayColor];
    
    [self addSubview:self.lblContent];
    
    [self addSubview:self.imgvContentBG];
    
    [self bringSubviewToFront:self.lblContent];
}

- (void)start {
    _countdownTime = 90;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdownTimer) userInfo:nil repeats:YES];
}

- (void)countdownTimer{
    _countdownTime -= 1;
    _lblContent.text = [NSString stringWithFormat:@"剩余%ds",_countdownTime];
}

#pragma mark - lazyload
- (UILabel *)lblContent {
    if (!_lblContent) {
        _lblContent = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame)-kTruthOrBraveCountdownTimerViewWidth/2,
                                                                0,
                                                                kTruthOrBraveCountdownTimerViewWidth,
                                                                kTruthOrBraveCountdownTimerViewHeight)];
        _lblContent.textAlignment = NSTextAlignmentCenter;
        _lblContent.text = @"剩余90s";
        [_lblContent setFont:[UIFont systemFontOfSize:12.0]];
        [_lblContent setTextColor:RGBA_COLOR(255.0, 221.0, 0, 1)];
    }
    return _lblContent;
}

- (UIImageView *)imgvContentBG {
    if (!_imgvContentBG) {
        _imgvContentBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kTruthOrBraveCountdownTimerBGWidth, kTruthOrBraveCountdownTimerBGHeight)];
        _imgvContentBG.image = [[UIImage imageNamed:@"live_room_truthOrBrave_countdown_timer_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(kTruthOrBraveCountdownTimerBGHeight/2-0.5, kTruthOrBraveCountdownTimerBGHeight/2-0.5, kTruthOrBraveCountdownTimerBGHeight/2-0.5, kTruthOrBraveCountdownTimerBGHeight/2-0.5)];
        _imgvContentBG.center = _lblContent.center;
    }
    return _imgvContentBG;
}
@end
