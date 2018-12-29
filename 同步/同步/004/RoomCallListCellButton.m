//
//  RoomCallListCellButton.m
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/10/16.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import "RoomCallListCellButton.h"

@implementation RoomCallListCellButton

#pragma mark - Over Write
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    if (self.hitSize.width>0 && self.hitSize.height>0) {
        CGRect bounds = self.bounds;
        //若原热区小于44x44，则放大热区，否则保持原大小不变
        CGFloat widthDelta = MAX(self.hitSize.width - bounds.size.width, 0);
        CGFloat heightDelta = MAX(self.hitSize.height - bounds.size.height, 0);
        bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
        return CGRectContainsPoint(bounds, point);
    }else {
        CGRect bounds = self.bounds;
        //若原热区小于44x44，则放大热区，否则保持原大小不变
        CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
        CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
        bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
        return CGRectContainsPoint(bounds, point);
    }
}
@end
