//
//  LiveRoomTruthOrBraveQuestionView.m
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/9/4.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import "LiveRoomTruthOrBraveQuestionView.h"
#import "ModelLocator.h"

// Btn
static NSInteger const kTruthOrBraveQuestionViewLeftBtnMarginLeft = 5;
static NSInteger const kTruthOrBraveQuestionViewLeftBtnWidth = 60;

// ProgressBar
static NSInteger const kTruthOrBraveQuestionViewProgressBarMarginTop = 20;
static NSInteger const kTruthOrBraveQuestionViewProgressBarHeight = 45;

@interface LiveRoomTruthOrBraveQuestionView()
@property (strong, nonatomic) UIImageView *imgvTitle;
@property (strong, nonatomic) UIImageView *imgvPinkProgress;
@property (strong, nonatomic) UIImageView *imgvBlueProgress;
@end

@implementation LiveRoomTruthOrBraveQuestionView

- (instancetype)initWithFrame:(CGRect)frame{
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = SCREEN_WIDTH;
    frame.size.height = 90;
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.backgroundColor = [UIColor blueColor];
    
    [self addSubview:self.imgvPinkProgress];
    [self addSubview:self.imgvBlueProgress];
    
    [self addSubview:self.imgvTitle];
}

#pragma mark - lazyload
- (UIImageView *)imgvTitle {
    if (!_imgvTitle) {
        _imgvTitle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"live_room_truthOrBrave_title.png"]];
        CGFloat height = _imgvTitle.frame.size.height;
        _imgvTitle.center = CGPointMake(SCREEN_WIDTH/2, height/2);
    }
    return _imgvTitle;
}

- (UIImageView *)imgvPinkProgress {
    if (!_imgvPinkProgress) {
        _imgvPinkProgress = [[UIImageView alloc] initWithFrame:CGRectMake(kTruthOrBraveQuestionViewLeftBtnMarginLeft+kTruthOrBraveQuestionViewLeftBtnWidth/2,
                                                                          kTruthOrBraveQuestionViewProgressBarMarginTop,
                                                                          SCREEN_WIDTH/2-kTruthOrBraveQuestionViewLeftBtnMarginLeft-kTruthOrBraveQuestionViewLeftBtnWidth/2,
                                                                          kTruthOrBraveQuestionViewProgressBarHeight)];
        [_imgvPinkProgress setImage:[UIImage imageNamed:@"live_room_truthOrBrave_progressBar_pink.png"]];
        
    }
    return _imgvPinkProgress;
}

- (UIImageView *)imgvBlueProgress {
    if (!_imgvBlueProgress) {
        _imgvBlueProgress = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2,
                                                                          kTruthOrBraveQuestionViewProgressBarMarginTop,
                                                                          SCREEN_WIDTH/2-kTruthOrBraveQuestionViewLeftBtnMarginLeft-kTruthOrBraveQuestionViewLeftBtnWidth/2,
                                                                          kTruthOrBraveQuestionViewProgressBarHeight)];
        [_imgvBlueProgress setImage:[UIImage imageNamed:@"live_room_truthOrBrave_progressBar_blue.png"]];
        
    }
    return _imgvBlueProgress;
}

@end
