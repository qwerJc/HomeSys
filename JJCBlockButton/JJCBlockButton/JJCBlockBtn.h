//
//  JJCBlockBtn.h
//  JJCBlockButton
//
//  Created by 贾辰 on 2018/9/26.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJCBlockBtn : UIButton
- (void)addClickActionBlock:(void(^)(void))actionBlock forControlEvents:(UIControlEvents)controlEvents;
@end
