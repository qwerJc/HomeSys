//
//  LiveRoomTruthOrBraveView.h
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/9/3.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSInteger const kTruthOrBraveViewBtnStartWidth = 180;
static NSInteger const kTruthOrBraveViewBtnStartHeight = 35;

typedef NS_ENUM(NSInteger, EnumRoomTruthOrBraveStatus) {
    EnumRoomTruthOrBraveStatusPre = 1,              // 开始前准备阶段
    EnumRoomTruthOrBraveStatusWait,                 // 等待惩罚阶段
    EnumRoomTruthOrBraveStatusVote,                 // 投票阶段
    EnumRoomTruthOrBraveStatusEnd,                  // 游戏结束阶段
};

@interface LiveRoomTruthOrBraveView : UIView

- (void)setup;

- (void)reset;

@end
