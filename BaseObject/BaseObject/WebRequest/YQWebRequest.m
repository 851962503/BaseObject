//
//  YQWebRequest.m
//  ringtone
//
//  Created by mopucheng on 2018/4/25.
//  Copyright © 2018年 WCL,Ltd. All rights reserved.
//

#import "YQWebRequest.h"

@implementation YQWebRequest

+ (instancetype)sharedClient {
    
    static dispatch_once_t once;
    static YQWebRequest *__singleton__;
    dispatch_once(&once, ^ {
        __singleton__ = [[self alloc] init];
    });
    return __singleton__;
}

YQ_DEFAULT_PARAMS_API(ListPageRequest:(NSDictionary *)params){

    return [self GET:@"" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:YQ_HTTP_FAILURE];
}

YQ_DEFAULT_PARAMS_API(youdaiRequest:(NSDictionary *)params) {
    
    return [self POST:@"https://api.51app.cn/loanapi/third/ukuan/apply" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:YQ_HTTP_FAILURE];
}

@end
