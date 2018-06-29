//
//  VideoCallListCellData.m
//  v6cn-iPhone
//
//  Created by 贾辰 on 2018/6/8.
//  Copyright © 2018年 Darcy Niu. All rights reserved.
//

#import "VideoCallListCellData.h"
//#import <NSDictionary+objectForKeyPath.h>
//#import <CommonUtility.h>
/*
{
    alias = "\U5c0f\U72d7\U86cb\U5f882";                   //name
    flag = 1;                                              //1 正在连麦队列中 ; 2 视频连麦中
    picuser = "https://vi3.6rooms.com/live/2016/05/26/15/1013v1464246499743547801.jpg"; //headImgURL
    rank = 1;                                               //排名 纪录当前用户在麦序列表中的序号（当有人进出房间时，rank不发生变化，仍为旧值）
    rid = 30106352;
    uid = 70316098;
}
 */
@implementation VideoCallListCellData
- (instancetype)initWithData:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.uid = [dic objectForKey:@"uid"];
        self.rid = [dic objectForKey:@"rid"];
        self.name = [dic objectForKey:@"alias"];
        self.headImgURL = [dic objectForKey:@"picuser"];
        self.flag = [dic objectForKey:@"flag"];
        self.rank = [dic objectForKey:@"rank"];
    }
    return self;
}
@end
