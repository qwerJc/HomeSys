//
//  LiveRoomTruthOrBraveCountdownTimerView.h
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/9/4.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EnumRoomTruthOrBraveCountdownTimerStatus) {
    EnumRoomTruthOrBraveCountdownTimerStatusStart = 1,           // 倒计时开始
    EnumRoomTruthOrBraveCountdownTimerStatusEnd,                 // 倒计时结束
};

@interface LiveRoomTruthOrBraveCountdownTimerView : UIView

/**
 开始倒计时
 */
- (void)start;

@end
