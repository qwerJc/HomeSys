//
//  HttpEngine+LiveLobby.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/28.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "HttpEngine+LiveLobby.h"

static NSString * const MiniVideoListDataRequestPadapi              = @"minivideo-getlist.php";

@implementation HttpEngine (LiveLobby)

/**
 <#Description#>

 @param type 
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
                                               onErrorBlock:(void(^)(NSError *error))errorBlock {
    if (![type isEqualToString:@"follow"]) {
        [self miniVideo_requestUnreadCount];
    }
    
    NSMutableDictionary *params = [@{@"act" : type,
                                     @"page" : page,
                                     @"padapi" : MiniVideoListDataRequestPadapi} mutableCopy];
    
    if (pageSize && ![pageSize isEqualToString:@""]) {
        params[@"pageSize"] = pageSize;
    }
    
    if (uid && ![uid isEqualToString:@""]) {
        params[@"uid"] = uid;
    }
    
    if (lastVid && ![lastVid isEqualToString:@""]) {
        params[@"lastVid"] = lastVid;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *url = [NSString stringWithFormat:@"%@?padapi=%@", GET_API_MOBILE_INDEX_URL, MiniVideoListDataRequestPadapi];
    
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSError *error;
             NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
             NSLog(@"%@",data);
             
             if (data) {
                 NSString *flag = [data objectForKey:@"flag"];
                 
                 if ([flag isEqualToString:@"001"]){
                     completionBlock(YES,[data objectForKey:@"content"]);
                 }else {
                     completionBlock(NO,data);
                 }
                 
             }
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             errorBlock(error);
         }];
    return manager;
}

- (AFHTTPSessionManager *)miniVideo_requestUnreadCount {
    return nil;
}
@end
