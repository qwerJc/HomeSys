//
//  VoiceCallRoomSeatCell.m
//  语音房
//
//  Created by 贾辰 on 2018/7/2.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "VoiceCallRoomSeatCell.h"

static NSInteger const kVideoCallRoomCellCrownWidth = 30.f;
static NSInteger const kVideoCallRoomCellCrownHight = kVideoCallRoomCellCrownWidth * 0.8;

@implementation VoiceCallRoomSeatCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    [self setBackgroundColor:[UIColor yellowColor]];
    
    UIImageView *imgvCrown = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kVideoCallRoomCellCrownWidth, kVideoCallRoomCellCrownHight)];
    [imgvCrown setImage:[UIImage imageNamed:@"voice_call_room_cell_crown"]];
    [self addSubview:imgvCrown];
    
    UIImageView *imgvHeadPic = [[UIImageView alloc] initWithFrame:CGRectMake(6.5, 13, 50, 50)];
    imgvHeadPic.backgroundColor = [UIColor orangeColor];
    [imgvHeadPic.layer setCornerRadius:25];
    imgvHeadPic.layer.masksToBounds = YES;
    [self addSubview:imgvHeadPic];
    
    UIButton *btnMore = [[UIButton alloc] initWithFrame:CGRectMake(kVideoCallRoomCellWidth - 30, 6, 30, 18)];
    [btnMore setBackgroundImage:[UIImage imageNamed:@"voice_call_room_cell_more"] forState:UIControlStateNormal];
    [self addSubview:btnMore];
    
    UILabel *lblName = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imgvHeadPic.frame)+7, CGRectGetMaxX(imgvHeadPic.frame), 14.5)];
    [lblName setFont:[UIFont systemFontOfSize:12.f]];
    [lblName setText:@"加减爱阿甲嘉"];
    [lblName setTextColor:[UIColor whiteColor]];
    [lblName setBackgroundColor:[UIColor blackColor]];
    [self addSubview:lblName];
    
    UIImageView *imgvIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"voice_call_room_cell_compere"]];
    [imgvIcon setCenter:CGPointMake(imgvHeadPic.center.x, kVideoCallRoomCellHeight-6.5)];
    [self addSubview:imgvIcon];
    
    UIImage *img1 = [UIImage imageNamed:@"voice_call_room_cell_crown"];
    UIImage *img2 = [UIImage imageNamed:@"voice_call_room_cell_more"];
    UIImage *img3 = [UIImage imageNamed:@"voice_call_room_cell_compere"];
}
@end
