//
//  AppDelegate+JJC.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/7/25.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "AppDelegate+JJC.h"
#import "LiveRoomTruthOrBraveView.h"
#import "PersonalVoiceRoomSeatView.h"

@implementation AppDelegate (JJC)
-(void)jjc_applicationDidFinishLaunching{
    [self jjc_registerNotifications];
}

-(void)jjc_registerNotifications{
    // 进入房间
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(jjc_liveRoomWillSetupNotificationAction:)
                                                 name:NOTIFICATIONS_ROOM_WILL_SETUP
                                               object:nil];
}

- (void)jjc_liveRoomWillSetupNotificationAction:(NSNotification *)notification{
//    [self addTruthOrBraveView];
    [self addPersonalVoiceRoomSeatView];
    
}

- (void)addTruthOrBraveView {
    LiveRoomTruthOrBraveView *viewBrave = [[LiveRoomTruthOrBraveView alloc] init];
    [self addFixedViewToFullScreenRoom:viewBrave withHighDisplayPriority:YES];
}

- (void)addPersonalVoiceRoomSeatView {
    PersonalVoiceRoomSeatView *seatView = [[PersonalVoiceRoomSeatView alloc] init];
    [self addFixedViewToFullScreenRoom:seatView withHighDisplayPriority:YES];
}
@end
