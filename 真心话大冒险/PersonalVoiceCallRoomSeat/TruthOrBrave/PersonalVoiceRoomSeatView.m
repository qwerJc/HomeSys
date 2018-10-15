//
//  PersonalVoiceRoomSeatView.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/10/7.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "PersonalVoiceRoomSeatView.h"

@interface PersonalVoiceRoomSeatView()
@property (strong, nonatomic) UIView *anchorView;
@property (strong, nonatomic) UIView *userViewLeft;
@property (strong, nonatomic) UIView *userViewRight;
@end

@implementation PersonalVoiceRoomSeatView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.backgroundColor = [UIColor greenColor];
    
    
}

@end
