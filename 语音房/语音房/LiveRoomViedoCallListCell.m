//
//  LiveRoomViedoCallListCell.m
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/6/5.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

/** 麦序列表Cell 序号宽度 */
//static NSInteger const kVideoCallListCellIndexMarginLeft = 13;
//static NSInteger const kVideoCallListCellIndexWidth = 30;
//static NSInteger const kVideoCallListCellIndexHeight = 18;
/** 麦序列表Cell 头像 */
//static NSInteger const kVideoCallListCellHeadImgMarginLeft = 5;

static NSInteger const kVideoCallListCellHeadImgMarginLeft = 13;
static NSInteger const kVideoCallListCellHeadImgWidth = 35;
/** 麦序列表Cell 昵称 */
//static NSInteger const kVideoCallListCellNameMarginLeft = 9;
static NSInteger const kVideoCallListCellNameMarginLeft = 13;
/** 麦序列表Cell 分割线 */
static NSInteger const kVideoCallListCellSeparationLineMarginLeft = 15;
/** 麦序列表Cell Button */
static NSInteger const kVideoCallListCellButtonMarginRight = 11;
static NSInteger const kVideoCallListCellButtonMarginLeft = 8;
static NSInteger const kVideoCallListCellButtonWidth = 60;
static NSInteger const kVideoCallListCellButtonHeight = 30;

#import "LiveRoomViedoCallListCell.h"
// Model
//#import "LiveLobbyLayoutHelper.h"
#import "AbstractAgoraVideoCall.h"
// Categroy
#import <UIColor+xiuchang_iPhone.h>
// View
#import <UserCirclePicView.h>
#import <UIImageView+WebCache.h>
#import "LiveRoomVideoCallListCard.h"

@interface LiveRoomViedoCallListCell() <LiveRoomViedoCallListRefuseCardDelegate>
//@property (strong, nonatomic) UILabel *lblIndex;
@property (strong, nonatomic) UserCirclePicView *userHeadPicView;
@property (strong, nonatomic) UILabel *lblName;
@property (strong, nonatomic) UIButton *btnCancel;
@property (strong, nonatomic) UIButton *btnAgree;
@property (strong, nonatomic) UIButton *btnRefuse;

@property (strong, nonatomic) RoomVideoCallUserData *data;

@property (strong, nonatomic) LiveRoomVideoCallListCard *card;
@end

@implementation LiveRoomViedoCallListCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        self.data = [RoomVideoCallUserData new];
    }
    return self;
}
-(void)createUI{
    self.backgroundColor = [UIColor clearColor];
    
//    self.lblIndex = [[UILabel alloc] initWithFrame:CGRectMake(kVideoCallListCellIndexMarginLeft, 0, kVideoCallListCellIndexWidth,kVideoCallListCellIndexHeight)];
//    [self.lblIndex setTextColor:[UIColor whiteColor]];
//    [self.lblIndex setFont:[UIFont systemFontOfSize:15.0]];
//    self.lblIndex.text = @"000";
//    self.lblIndex.textAlignment = NSTextAlignmentCenter;
////    [self.lblIndex sizeToFit];
//    CGFloat lblIndexCenterX = self.lblIndex.center.x;
//    self.lblIndex.center = CGPointMake(lblIndexCenterX, kVideoCallListCellHeight/2);
//    [self addSubview:self.lblIndex];
    
    self.userHeadPicView = [[UserCirclePicView alloc] initWithFrame:CGRectMake(kVideoCallListCellHeadImgMarginLeft, 0, kVideoCallListCellHeadImgWidth, kVideoCallListCellHeadImgWidth)];
    self.userHeadPicView.center = CGPointMake(self.userHeadPicView.center.x, kVideoCallListCellHeight/2);
    [self addSubview:self.userHeadPicView];
    
    self.btnCancel = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 75, 30)];
    [self.btnCancel.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
    [self.btnCancel setTitle:@"取消连麦" forState:UIControlStateNormal];
    [self.btnCancel setTitleColor:RGBA_COLOR(255.0, 51.0, 51.0, 1) forState:UIControlStateNormal];
    [self.btnCancel setTitleColor:RGBA_COLOR(229.0, 46.0, 46.0, 1) forState:UIControlStateHighlighted];
    [self.btnCancel setBackgroundImage:[[UIImage imageNamed:@"live_room_video_call_list_cell_btn_cancel_n.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 15, 15, 15)] forState:UIControlStateNormal];
    [self.btnCancel setBackgroundImage:[[UIImage imageNamed:@"live_room_video_call_list_cell_btn_cancel_h.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 15, 15, 15)] forState:UIControlStateHighlighted];
    [self.btnCancel addTarget:self action:@selector(onCancelVideoCallRequestAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnCancel];
    [self.btnCancel setHidden:YES];
    
    self.btnAgree = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - kVideoCallListCellButtonMarginRight - kVideoCallListCellButtonWidth, (kVideoCallListCellHeight - kVideoCallListCellButtonHeight)/2, kVideoCallListCellButtonWidth, kVideoCallListCellButtonHeight)];
    [self.btnAgree setTitle:@"同意" forState:UIControlStateNormal];
    [self.btnAgree.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
    [self.btnAgree.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.btnAgree setBackgroundImage:[[UIImage imageNamed:@"live_room_video_call_list_cell_btn_agree_n.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 15, 15, 15)] forState:UIControlStateNormal];
    [self.btnAgree setTitleColor:RGBA_COLOR(255.0, 51.0, 51.0, 1) forState:UIControlStateNormal];
    [self.btnAgree setBackgroundImage:[[UIImage imageNamed:@"live_room_video_call_list_cell_btn_agree_h.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 15, 15, 15)] forState:UIControlStateHighlighted];
    [self.btnAgree setTitleColor:RGBA_COLOR(229.0, 46.0, 46.0, 1) forState:UIControlStateHighlighted];
    [self.btnAgree addTarget:self action:@selector(onAgreeVideoCallAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnAgree];
    
    self.btnRefuse = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.btnAgree.frame) - kVideoCallListCellButtonMarginLeft - kVideoCallListCellButtonWidth, CGRectGetMinY(self.btnAgree.frame), kVideoCallListCellButtonWidth, kVideoCallListCellButtonHeight)];
    [self.btnRefuse setTitle:@"拒绝" forState:UIControlStateNormal];
    [self.btnRefuse.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
    [self.btnRefuse.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.btnRefuse setBackgroundImage:[[UIImage imageNamed:@"live_room_video_call_list_cell_btn_refuse_n.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 15, 15, 15)] forState:UIControlStateNormal];
    [self.btnRefuse setTitleColor:RGBA_COLOR(255.0, 255.0, 255.0, 1) forState:UIControlStateNormal];
    [self.btnRefuse setBackgroundImage:[[UIImage imageNamed:@"live_room_video_call_list_cell_btn_refuse_h.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 15, 15, 15)] forState:UIControlStateHighlighted];
    [self.btnRefuse setTitleColor:RGBA_COLOR(204.0, 204.0, 204.0, 1) forState:UIControlStateHighlighted];
    [self.btnRefuse addTarget:self action:@selector(onRefuseVideoCallAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnRefuse];
    
    self.lblName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.userHeadPicView.frame) + kVideoCallListCellNameMarginLeft, 0, 0, 18)];
    [self.lblName setTextColor:[UIColor whiteColor]];
    self.lblName.center = CGPointMake(CGRectGetMidX(self.lblName.frame), kVideoCallListCellHeight/2);
    [self.lblName setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:self.lblName];
    
    UIView *bottomSeparationLine = [[UIView alloc] initWithFrame:CGRectMake(kVideoCallListCellSeparationLineMarginLeft, kVideoCallListCellHeight - kOnePixelLength, SCREEN_WIDTH - kVideoCallListCellSeparationLineMarginLeft, kOnePixelLength)];
    bottomSeparationLine.backgroundColor = RGBA_COLOR(255.0, 255.0, 255.0, 0.15);
    [self addSubview:bottomSeparationLine];
    
    self.card = [[LiveRoomVideoCallListCard alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.card.enumBGType = EnumCustomRoomPopOverCardViewTypeWithModal;
    self.card.refuseCardDelegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
#pragma mark - Publish
-(void)configData:(VideoCallListCellData *)data withType:(EnumVideoCallCellType)type{
//    self.lblIndex.text = data.rank;
    
    self.data.userPic = data.headImgURL;
    self.data.alias = data.name;
    self.data.uid = data.uid;

    self.lblName.text = data.name;
    
    self.btnCancel.center = CGPointMake(SCREEN_WIDTH - 13 - CGRectGetWidth(self.btnCancel.frame)/2, CGRectGetMidY(self.lblName.frame));
    
    [self.userHeadPicView setPicImageURL:data.headImgURL];
    
    CGRect lblNameFrame = self.lblName.frame;
    
    if (type == EnumVideoCallCellTypeAudience) {
        [self.btnAgree setHidden:YES];
        [self.btnRefuse setHidden:YES];
        [self.btnCancel setHidden:NO];
        
        if ([model.uid isEqualToString:data.uid]) {
            // 显示 “取消连接”
            self.btnCancel.hidden = NO;
            lblNameFrame.size.width = CGRectGetMinX(self.btnCancel.frame) - CGRectGetMaxX(self.userHeadPicView.frame) - kVideoCallListCellButtonMarginLeft*2;
        }else{
            self.btnCancel.hidden = YES;
            lblNameFrame.size.width = SCREEN_WIDTH - CGRectGetMaxX(self.userHeadPicView.frame) - kVideoCallListCellButtonMarginLeft*2;
        }
    }else if (type == EnumVideoCallCellTypeAnchor){
        [self.btnCancel setHidden:YES];
        [self.btnAgree setHidden:NO];
        [self.btnRefuse setHidden:NO];
        
        lblNameFrame.size.width = CGRectGetMinX(self.btnRefuse.frame) - CGRectGetMaxX(self.userHeadPicView.frame) - kVideoCallListCellButtonMarginLeft*2;
    }
    [self.lblName setFrame:lblNameFrame];
    
}
#pragma mark - CallBack
-(void)refuseVideoCall{
    if ([_delegate respondsToSelector:@selector(callbackRefuseBtnAction:)]) {
        [_delegate callbackRefuseBtnAction:self.data.uid];
    }
}
#pragma mark - Btn Action
-(void)onCancelVideoCallRequestAction{
    if ([_delegate respondsToSelector:@selector(callbackCancelBtnAction:)]) {
        [_delegate callbackCancelBtnAction:model.uid];
    }
}
-(void)onRefuseVideoCallAction{
    [self.card setup];
    [self.card setUID:self.data.uid];
    [self.card show];
}
-(void)onAgreeVideoCallAction{
    if ([_delegate respondsToSelector:@selector(callbackAgreeBtnAction:)]) {
        
        [_delegate callbackAgreeBtnAction:self.data];
    }

}
@end
