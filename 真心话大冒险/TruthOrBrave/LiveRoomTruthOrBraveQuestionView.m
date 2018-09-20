//
//  LiveRoomTruthOrBraveQuestionView.m
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/9/4.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import "LiveRoomTruthOrBraveQuestionView.h"
#import "ModelLocator.h"
#import "UIColor+xiuchang_iPhone.h"

// Btn
static NSInteger const kTruthOrBraveQuestionViewLeftBtnMarginLeft = 5;
static NSInteger const kTruthOrBraveQuestionViewLeftBtnWidth = 60;
static NSInteger const kTruthOrBraveQuestionViewLeftBtnHeight = 60;
// ProgressBar
static NSInteger const kTruthOrBraveQuestionViewProgressBarMarginTop = 20;
static NSInteger const kTruthOrBraveQuestionViewProgressBarHeight = 45;

// question index
static NSInteger const kTruthOrBraveQuestionViewQuestionIndexMarginLeft = 5;
static NSInteger const kTruthOrBraveQuestionViewQuestionIndexWidth = 14;

// Question View
static NSInteger const kTruthOrBraveQuestionViewQuestionViewMarginLeft = 5;
//static NSInteger const kTruthOrBraveQuestionViewQuestionViewMarginTop = 6;
static NSInteger const kTruthOrBraveQuestionViewQuestionViewMarginRight = 10;
static NSInteger const kTruthOrBraveQuestionViewQuestionViewHeight = 33;

@interface LiveRoomTruthOrBraveQuestionView()
@property (strong, nonatomic) UIImageView *imgvTitle;

@property (strong, nonatomic) UIImageView *userNamePinkBG;
@property (strong, nonatomic) UILabel *lblPinkName;
@property (strong, nonatomic) UIImageView *userNameBlueBG;
@property (strong, nonatomic) UILabel *lblBlueName;

@property (strong, nonatomic) UIButton *btnPinkVote;
@property (strong, nonatomic) UIButton *btnBlueVote;
@property (strong, nonatomic) UIImageView *imgvPinkProgress;
@property (strong, nonatomic) UIImageView *imgvBlueProgress;

@property (strong, nonatomic) UIImageView *imgvQuestionIndex;   // 问题序号
@property (strong, nonatomic) UITextView *txvQuestion;
@end

@implementation LiveRoomTruthOrBraveQuestionView

- (instancetype)initWithFrame:(CGRect)frame{
    frame.origin.x = 0;
    frame.origin.y = 27;
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
    
    [self addSubview:self.btnPinkVote];
    [self addSubview:self.btnBlueVote];
    
    [self addSubview:self.userNamePinkBG];
    [self addSubview:self.userNameBlueBG];
    
    [self addSubview:self.imgvTitle];
    
    [self addSubview:self.imgvQuestionIndex];
    [self addSubview:self.txfQuestion];
}
#pragma mark - Btn Action
- (void)onShowPinkVoteViewAction {
    NSLog(@"粉色");
}

- (void)onShowBlueVoteViewAction {
    NSLog(@"蓝色");
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

- (UIButton *)btnPinkVote {
    if (!_btnPinkVote) {
        _btnPinkVote = [[UIButton alloc] initWithFrame:CGRectMake(kTruthOrBraveQuestionViewLeftBtnMarginLeft,
                                                                  CGRectGetMidY(self.imgvPinkProgress.frame)-kTruthOrBraveQuestionViewLeftBtnHeight/2,
                                                                  kTruthOrBraveQuestionViewLeftBtnWidth,
                                                                  kTruthOrBraveQuestionViewLeftBtnHeight)];
        [_btnPinkVote setBackgroundImage:[UIImage imageNamed:@"live_room_truthOrBrave_btn_vote_pink_n.png"] forState:UIControlStateNormal];
        [_btnPinkVote setBackgroundImage:[UIImage imageNamed:@"live_room_truthOrBrave_btn_vote_pink_h.png"] forState:UIControlStateHighlighted];
        [_btnPinkVote addTarget:self action:@selector(onShowPinkVoteViewAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnPinkVote;
}

- (UIButton *)btnBlueVote {
    if (!_btnBlueVote) {
        _btnBlueVote = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-kTruthOrBraveQuestionViewLeftBtnMarginLeft-kTruthOrBraveQuestionViewLeftBtnWidth,
                                                                  CGRectGetMidY(self.imgvPinkProgress.frame)-kTruthOrBraveQuestionViewLeftBtnHeight/2,
                                                                  kTruthOrBraveQuestionViewLeftBtnWidth,
                                                                  kTruthOrBraveQuestionViewLeftBtnHeight)];
        [_btnBlueVote setBackgroundImage:[UIImage imageNamed:@"live_room_truthOrBrave_btn_vote_blue_n.png"] forState:UIControlStateNormal];
        [_btnBlueVote setBackgroundImage:[UIImage imageNamed:@"live_room_truthOrBrave_btn_vote_blue_h.png"] forState:UIControlStateHighlighted];
        [_btnBlueVote addTarget:self action:@selector(onShowBlueVoteViewAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnBlueVote;
}

- (UIImageView *)userNamePinkBG {
    if (!_userNamePinkBG) {
        _userNamePinkBG = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_btnPinkVote.frame),
                                                                      CGRectGetMaxY(_btnPinkVote.frame)+2,
                                                                      kTruthOrBraveQuestionViewLeftBtnWidth,
                                                                      15)];
        [_userNamePinkBG setImage:[[UIImage imageNamed:@"live_room_truthOrBrave_name_pink_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(14.5f, 14.5f,14.5f, 14.5f)]];
        
        
        _lblPinkName = [[UILabel alloc] initWithFrame:CGRectMake(15/2,
                                                                 0,
                                                                 kTruthOrBraveQuestionViewLeftBtnWidth-15,
                                                                 15)];
        [_lblPinkName setTextColor:RGBA_COLOR(255.0, 255.0, 255.0, 1)];
        [_lblBlueName setBackgroundColor:[UIColor greenColor]];
        [_lblPinkName setFont:[UIFont systemFontOfSize:11.0]];
        _lblPinkName.text = @"兔兔小师妹";
        [_userNamePinkBG addSubview:_lblPinkName];
    }
    return _userNamePinkBG;
}

- (UIImageView *)userNameBlueBG {
    if (!_userNameBlueBG) {
        _userNameBlueBG = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_btnBlueVote.frame),
                                                                        CGRectGetMaxY(_btnBlueVote.frame)+2,
                                                                        kTruthOrBraveQuestionViewLeftBtnWidth,
                                                                        15)];
        [_userNameBlueBG setImage:[[UIImage imageNamed:@"live_room_truthOrBrave_name_blue_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(14.5f, 14.5f,14.5f, 14.5f)]];
        
        
        _lblBlueName = [[UILabel alloc] initWithFrame:CGRectMake(15/2,
                                                                 0,
                                                                 kTruthOrBraveQuestionViewLeftBtnWidth-15,
                                                                 15)];
        [_lblBlueName setTextColor:RGBA_COLOR(255.0, 255.0, 255.0, 1)];
        [_lblBlueName setFont:[UIFont systemFontOfSize:11.0]];
        _lblBlueName.text = @"兔兔小师妹";
        [_userNameBlueBG addSubview:_lblBlueName];
    }
    return _userNameBlueBG;
}

- (UIImageView *)imgvQuestionIndex {
    if (!_imgvQuestionIndex) {
        _imgvQuestionIndex = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_btnPinkVote.frame)+kTruthOrBraveQuestionViewQuestionIndexMarginLeft,
                                                                           CGRectGetMidY(_imgvPinkProgress.frame) - kTruthOrBraveQuestionViewQuestionIndexWidth/2,
                                                                           kTruthOrBraveQuestionViewQuestionIndexWidth,
                                                                           kTruthOrBraveQuestionViewQuestionIndexWidth)];
        [_imgvQuestionIndex setBackgroundColor:[UIColor yellowColor]];
    }
    return _imgvQuestionIndex;
}
- (UITextView *)txfQuestion {
    if (!_txvQuestion) {
        _txvQuestion = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_imgvQuestionIndex.frame) +kTruthOrBraveQuestionViewQuestionViewMarginLeft,
                                                                     CGRectGetMidY(_imgvPinkProgress.frame) - kTruthOrBraveQuestionViewQuestionViewHeight/2,
                                                                     CGRectGetMinX(_btnBlueVote.frame) - kTruthOrBraveQuestionViewQuestionViewMarginRight-CGRectGetMaxX(_imgvQuestionIndex.frame) - kTruthOrBraveQuestionViewQuestionViewMarginLeft,
                                                                     0)];
        _txvQuestion.text = @"fdskljkljklfsdjkfjdsakjklfdasjklsfjdakljfsadljfsdaldsafdsafdsafasdfds";
        _txvQuestion.font = [UIFont systemFontOfSize:13.0];
        [_txvQuestion sizeToFit];
        CGFloat centerX = _txvQuestion.center.x;
        _txvQuestion.center = CGPointMake(centerX, CGRectGetMidY(_imgvQuestionIndex.frame));
        [_txvQuestion setContentSize:CGSizeMake(CGRectGetWidth(_txvQuestion.frame), kTruthOrBraveQuestionViewQuestionViewHeight)];
        [_txvQuestion setBackgroundColor:[UIColor clearColor]];
    }
    return _txvQuestion;
}
@end
