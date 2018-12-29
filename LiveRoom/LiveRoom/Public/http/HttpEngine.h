//
//  HttpEngine.h
//  LiveRoom
//
//  Created by 贾辰 on 2018/12/28.
//  Copyright © 2018年 贾辰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


//#if DEBUG
//#define GET_API_DOMAIN_NAME (ApplicationDelegate.isDevelopmentEnvironment ? @"http://dev.v.6.cn/" : @"https://v.6.cn/")
#define GET_API_DOMAIN_NAME @"https://v.6.cn/"
#define GET_API_MOBILE_INDEX_URL [NSString stringWithFormat:@"%@%@",GET_API_DOMAIN_NAME, @"coop/mobile/index.php"]

//#else
//#define GET_API_DOMAIN_NAME @"https://v.6.cn/"
//#define GET_API_MOBILE_INDEX_URL @"https://v.6.cn/coop/mobile/index.php"

@interface HttpEngine : NSObject
+ (HttpEngine *)shareEngine;
@end
