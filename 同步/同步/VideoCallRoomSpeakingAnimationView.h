//
//  VideoCallRoomSpeakingAnimationView.h
//  同步
//
//  Created by 贾辰 on 18/7/8.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCallRoomSpeakingAnimationView : UIView

/**
 设置初始化动画的宽度.
 
 @param width 宽度.
 */
- (void)setLayerWidth:(CGFloat)width;

/**
 设置动画的背景色.
 
 @param color 背景色.
 */
- (void)setLayerColor:(UIColor *)color;

/**
 开始动画.
 */
- (void)startAnimation;

/**
 结束动画.
 */
- (void)stopAnimation;

@end
