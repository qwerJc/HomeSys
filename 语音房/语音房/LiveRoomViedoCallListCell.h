//
//  LiveRoomViedoCallListCell.h
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/6/5.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoCallListCellData.h"

@class RoomVideoCallUserData; //RoomVideoCallUserData 需要

/** 麦序列表Cell  */
static NSInteger const kVideoCallListCellHeight = 55.f;

typedef NS_ENUM(NSInteger, EnumVideoCallCellType) {               // TopBar样式
    EnumVideoCallCellTypeAudience = 0,                      // 用户端-样式（什么都没有）
    EnumVideoCallCellTypeAnchor,                            // 主播端-样式（同意和拒绝按钮）
};

@protocol LiveRoomViedoCallListCellDelegate <NSObject>
-(void)callbackCancelBtnAction:(NSString *)targetUid;
-(void)callbackRefuseBtnAction:(NSString *)targetUid;
-(void)callbackAgreeBtnAction:(RoomVideoCallUserData *)targetUserData;
@end

@interface LiveRoomViedoCallListCell : UITableViewCell

@property (weak, nonatomic) id<LiveRoomViedoCallListCellDelegate>   delegate;

-(void)configData:(VideoCallListCellData *)data withType:(EnumVideoCallCellType)type;
@end
