//
//  LiveRoomTruthOrBraveView.m
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/9/3.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import "LiveRoomTruthOrBraveView.h"
#import "ModelLocator.h"
#import "LiveRoomTruthOrBraveQuestionView.h"
#import "LiveRoomTruthOrBraveCountdownTimerView.h"


@interface LiveRoomTruthOrBraveView()

@property (strong, nonatomic) LiveRoomTruthOrBraveQuestionView *questionView;
@property (strong, nonatomic) LiveRoomTruthOrBraveCountdownTimerView *countdownTimerView;
@property (strong, nonatomic) UIImageView *imgvPrepareBG;

@end

@implementation LiveRoomTruthOrBraveView

- (instancetype)initWithFrame:(CGRect)frame {
    frame.origin.x = 0;
    frame.origin.y = 340;
    frame.size.width = SCREEN_WIDTH;
    frame.size.height = 70;
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        
    }
    return self;
}


- (void)createUI {
    self.backgroundColor = [UIColor grayColor];
    
    [self addSubview:self.questionView];
    
    [self addSubview:self.countdownTimerView];
    
    [self addSubview:self.imgvPrepareBG];
    
}

- (void)changeState:(EnumRoomTruthOrBraveStatus)type {
    switch (type) {
        case EnumRoomTruthOrBraveStatusPre:
            [self.imgvPrepareBG setHidden:NO];
            break;
        case EnumRoomTruthOrBraveStatusWait:
            [self.imgvPrepareBG setHidden:YES];
            break;
        case EnumRoomTruthOrBraveStatusVote:
            [self.questionView setHidden:NO];
            [self.imgvPrepareBG setHidden:YES];
            break;
        case EnumRoomTruthOrBraveStatusEnd:
            [self.imgvPrepareBG setHidden:YES];
            break;
    }
}
#pragma mark - lazyload
- (LiveRoomTruthOrBraveQuestionView *)questionView {
    if (!_questionView) {
        _questionView = [[LiveRoomTruthOrBraveQuestionView alloc] init];
    }
    return _questionView;
}

- (LiveRoomTruthOrBraveCountdownTimerView *)countdownTimerView {
    if (!_countdownTimerView) {
        _countdownTimerView = [[LiveRoomTruthOrBraveCountdownTimerView alloc] init];
    }
    return _countdownTimerView;
}

//- (UIButton *)btnStart {
//    if (!_btnStart) {
//        _btnStart = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-kTruthOrBraveViewBtnStartWidth)/2, CGRectGetHeight(self.frame) - kTruthOrBraveViewBtnStartHeight, kTruthOrBraveViewBtnStartWidth, kTruthOrBraveViewBtnStartHeight)];
//        [_btnStart setBackgroundColor:[UIColor yellowColor]];
//        [_btnStart addTarget:self action:@selector(onStartGameAction) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _btnStart;
//}

- (UIImageView *)imgvPrepareBG {
    if (!_imgvPrepareBG) {
        _imgvPrepareBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"live_room_truthOrBrave_prepare_BG.png"]];
        _imgvPrepareBG.center = CGPointMake(SCREEN_WIDTH/2, CGRectGetHeight(self.frame)/2);
        _imgvPrepareBG.userInteractionEnabled = YES;
        
        UIButton *btnStartGame = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(_imgvPrepareBG.frame)-190)/2,
                                                                            CGRectGetHeight(_imgvPrepareBG.frame)-40,
                                                                            190,
                                                                            40)];
        [btnStartGame addTarget:self action:@selector(onStartGameAction) forControlEvents:UIControlEventTouchUpInside];
        [_imgvPrepareBG addSubview:btnStartGame];
    }
    return _imgvPrepareBG;
}

#pragma mark - Btn Action
- (void)onStartGameAction {
    NSLog(@"开始游戏");
    [self changeState:EnumRoomTruthOrBraveStatusVote];
}

@end
