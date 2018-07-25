//
//  YQWebRequest.h
//  ringtone
//
//  Created by mopucheng on 2018/4/25.
//  Copyright © 2018年 WCL,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMHTTPClient.h"
#import "GPAPIHeader.h"
@interface YQWebRequest : FMHTTPClient

+ (instancetype)sharedClient;

YQ_DEFAULT_PARAMS_API(ListPageRequest:(NSDictionary *)params);

YQ_DEFAULT_PARAMS_API(youdaiRequest:(NSDictionary *)params);

@end
