//
//  AppDelegate.h
//  LiveRoom
//
//  Created by 贾辰 on 2018/7/25.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelLocator.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

#pragma mark - Check If Certain Room is Visible
/** 获取当前房间类型 */
- (EnumRoomType)getCurrentRoomType;

#pragma mark - Room Tools
/** 添加 固定视图 至秀场全屏直播、发直播房间， isHighPriority 表示是否显示在公聊及送礼条上方 */
- (void)addFixedViewToFullScreenRoom:(UIView *)view withHighDisplayPriority:(BOOL)isHighPriority;

///** 添加 keyboard Sensitive 视图 至 秀场全屏直播、发直播房间，坐标计算以屏幕最大安全区为准 */
//- (void)addkeyboardSensitiveOnlyViewToFullScreenRoom:(UIView *)view withHighPriority:(EnumFSLiveContentPresentPriority)enumPresentPriority;

@end

