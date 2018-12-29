//
//  LiveLobbyMiniVideoListData.m
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/29.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import "LiveLobbyMiniVideoListData.h"

@implementation LiveLobbyMiniVideoListData
-(instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        _name = [dic objectForKey:@"alias"];
        _bigPicURL = [dic objectForKey:@"bigpicurl"];
        _picURL = [dic objectForKey:@"picurl"];
        _UserPicURL = [dic objectForKey:@"picuser"];
        _sec = [dic objectForKey:@"sec"];
        _title = [dic objectForKey:@"title"];
        _uid = [dic objectForKey:@"uid"];
        _vid = [dic objectForKey:@"vid"];
        _vnum = [dic objectForKey:@"vnum"];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@",@{@"name":_name,
                                              @"bigpicurl":_bigPicURL,
                                              @"picurl":_picURL,
                                              @"picuser":_UserPicURL,
                                              @"sec":_sec,
                                              @"title":_title,
                                              @"uid":_uid,
                                              @"vid":_vid,
                                              @"vnum":_vnum,
                                              }];
}
@end
