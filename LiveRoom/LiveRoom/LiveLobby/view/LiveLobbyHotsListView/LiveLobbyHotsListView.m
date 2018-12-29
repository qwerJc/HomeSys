//
//  LiveLobbyHotsListView.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/28.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "LiveLobbyHotsListView.h"

@implementation LiveLobbyHotsListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.backgroundColor = [UIColor yellowColor];
}

@end
