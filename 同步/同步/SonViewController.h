//
//  SonViewController.h
//  同步
//
//  Created by 贾辰 on 2018/8/30.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tryDelegate <NSObject>
-(void)sayTemString;
@end

@interface SonViewController : UIViewController
@property (weak, nonatomic) id<tryDelegate> delegate;
- (void)Log;
@end
