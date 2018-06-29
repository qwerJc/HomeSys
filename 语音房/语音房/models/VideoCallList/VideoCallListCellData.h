//
//  VideoCallListCellData.h
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/6/8.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoCallListCellData : NSObject
@property (strong, nonatomic) NSString *uid;
@property (strong, nonatomic) NSString *rid;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *headImgURL;
@property (strong, nonatomic) NSString *flag;   //1 正在连麦队列中 ; 2 视频连麦中
@property (strong, nonatomic) NSString *rank;

- (instancetype)initWithData:(NSDictionary *)dic;
@end
