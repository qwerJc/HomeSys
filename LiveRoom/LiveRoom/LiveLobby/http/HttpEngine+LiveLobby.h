//
//  HttpEngine+LiveLobby.h
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/28.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "HttpEngine.h"

@interface HttpEngine (LiveLobby)
#pragma mark - Mini Video


/**
 获取 大厅-小视频列表 数据

 @param type 类型（推荐/关注/最新） @"recommend"/@"follow"@"new"
 @param uid <#uid description#>
 @param page <#page description#>
 @param pageSize <#pageSize description#>
 @param lastVid <#lastVid description#>
 @param completionBlock <#completionBlock description#>
 @param errorBlock <#errorBlock description#>
 @return <#return value description#>
 */
- (AFHTTPSessionManager *)miniVideo_requestListDataWithType:(NSString *)type
                                                        uid:(NSString *)uid
                                                       page:(NSString *)page
                                                   pageSize:(NSString *)pageSize
                                                    lastVid:(NSString *)lastVid
                                          onCompletionBlock:(void(^)(BOOL isSuccess, NSDictionary *content))completionBlock
                                               onErrorBlock:(void(^)(NSError *error))errorBlock;


/**
 获取小视频 关注页面未读数
 */
- (AFHTTPSessionManager *)miniVideo_requestUnreadCount;
@end

