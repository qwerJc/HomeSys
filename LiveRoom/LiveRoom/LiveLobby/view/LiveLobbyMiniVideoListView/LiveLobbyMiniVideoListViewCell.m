//
//  LiveLobbyMiniVideoListViewCell.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/29.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "LiveLobbyMiniVideoListViewCell.h"

static const CGFloat kDurationTimeMarginRight = 4.f;
static const CGFloat kDurationTimeMarginTop = 7.f;
static const CGFloat kDurationTimeWidth = 26.f;
static const CGFloat kDurationTimeHeight = 9.f;

static const CGFloat kTitleMarginBottom = 9.f;
static const CGFloat kTitleMarginLeft = 9.f;
static const CGFloat kTitleWidth = 9.f;
static const CGFloat kTitleHeight = 9.f;

@interface LiveLobbyMiniVideoListViewCell()
@property (strong, nonatomic) UIImageView *imgvBG;
@property (strong, nonatomic) UILabel *lblDurationTime;
@property (strong, nonatomic) UIImageView *imgvPlayIcon;
@property (strong, nonatomic) UILabel *lblTitle;
@property (strong, nonatomic) UIImageView *imgvHeadPic;
@property (strong, nonatomic) UILabel *lblName;
@property (strong, nonatomic) UIImageView *imgvWatchIcon;
@property (strong, nonatomic) UILabel *lblWatchNum;


@property (strong, nonatomic) LiveLobbyMiniVideoListData *data;
@end

@implementation LiveLobbyMiniVideoListViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    _imgvBG = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:_imgvBG];
    
    _lblDurationTime = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - kDurationTimeWidth - kDurationTimeMarginRight, kDurationTimeMarginTop, kDurationTimeWidth, kDurationTimeHeight)];
    [_lblDurationTime setFont:[UIFont systemFontOfSize:10.0]];
    _lblDurationTime.text = @"00:00";
    
    _imgvPlayIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mini_video_lobby_play_icon_big.png"]];
    _imgvPlayIcon.center = self.center;
    
    _lblTitle
    
}
- (void)setupWithData:(LiveLobbyMiniVideoListData *)data {
    self.data = data;
}
@end
