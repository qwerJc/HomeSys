//
//  LiveLobbyMainScrollView.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/28.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "LiveLobbyMainScrollView.h"
#import "LiveLobbyMiniVideoListView.h"
#import "LiveLobbyHotsListview.h"
#import "ModelLocator.h"

@interface LiveLobbyMainScrollView()<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) LiveLobbyMiniVideoListView *miniVideoListView;
@property (strong, nonatomic) LiveLobbyHotsListView *hotsListView;
@end

@implementation LiveLobbyMainScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    frame.origin.x = 0;
    frame.origin.y = 64;
    frame.size.width = SCREEN_WIDTH;
    frame.size.height = SCREEN_HEIGHT - 64 - 49;
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.backgroundColor = [UIColor whiteColor];
    
    [self createScrollView];
    [self createHotsList];
    [self createMiniVideoList];
    
}

- (void)createScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*7, CGRectGetHeight(self.frame));
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
}

- (void)createMiniVideoList {
    _miniVideoListView = [[LiveLobbyMiniVideoListView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetHeight(self.frame))];
    [_scrollView addSubview:_miniVideoListView];
    
    [_miniVideoListView setup];
}

- (void)createHotsList {
    _hotsListView = [[LiveLobbyHotsListView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, CGRectGetHeight(self.frame))];
    [_scrollView addSubview:_hotsListView];
}
@end
