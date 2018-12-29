//
//  LiveLobbyMiniVideoListViewCell.h
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/29.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelLocator.h"

@class LiveLobbyMiniVideoListData;

#define kCellWidth                     ((SCREEN_WIDTH - LiveLobbyMiniVideoListCellSpace * 3.f) / 2.f)
#define kCellHeight                    (kCellWidth * (4.f / 3.f))

static const CGFloat LiveLobbyMiniVideoListCellSpace = 7.f;

NS_ASSUME_NONNULL_BEGIN

@interface LiveLobbyMiniVideoListViewCell : UICollectionViewCell
- (void)setupWithData:(LiveLobbyMiniVideoListData *)data;
@end

NS_ASSUME_NONNULL_END
