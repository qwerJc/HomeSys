//
//  LiveLobbyMiniVideoListData.h
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/29.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LiveLobbyMiniVideoListData : NSObject
@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *bigPicURL;
@property (strong, nonatomic, readonly) NSString *picURL;
@property (strong, nonatomic, readonly) NSString *UserPicURL;
@property (strong, nonatomic, readonly) NSString *sec;//秒数
@property (strong, nonatomic, readonly) NSString *title;
@property (strong, nonatomic, readonly) NSString *uid;
@property (strong, nonatomic, readonly) NSString *vid;
@property (strong, nonatomic, readonly) NSString *vnum;

-(instancetype)initWithDic:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
