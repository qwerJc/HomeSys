//
//  AppDelegate+JJC.h
//  LiveRoom
//
//  Created by 贾辰 on 2018/7/25.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "AppDelegate.h"

#define NOTIFICATIONS_ROOM_WILL_SETUP @"cn.6.roomWillSetup" //房间已获得数据，即将设置界面的通知 [roomType]

@interface AppDelegate (JJC)
-(void)jjc_applicationDidFinishLaunching;
@end
