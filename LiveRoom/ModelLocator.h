//
//  ModelLocator.h
//  LiveRoom
//
//  Created by 贾辰 on 2018/7/25.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import <Foundation/Foundation.h>

#define model [ModelLocator sharedModelLocator]

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define SCREEN_WIDTH ([UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale)
#define SCREEN_HEIGHT ([UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale)

typedef NS_ENUM(NSInteger,  EnumRoomType)
{
    RoomTypeLive = 0, //直播房间（原半屏直播房间，已废弃）
    RoomTypeGame, //游戏房间
    RoomTypePublish, //发布直播房间
    RoomTypeFullScreenLive, //全屏直播房间
    RoomTypeYuliaoVoiceTalk, //语聊语音连麦房间
    RoomTypeShortVideo, //短视频房间
};

@interface ModelLocator : NSObject

@end
