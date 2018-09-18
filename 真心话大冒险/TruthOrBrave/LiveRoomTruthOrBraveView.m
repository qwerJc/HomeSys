//
//  LiveRoomTruthOrBraveView.m
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/9/3.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import "LiveRoomTruthOrBraveView.h"
#import <ModelLocator.h>
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
        _imgvPrepareBG = [[UIImageView alloc] initWithImage:<#(nullable UIImage *)#>]
    }
}

#pragma mark - Btn Action
- (void)onStartGameAction {
    
}

@end
