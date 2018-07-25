//
//  FMHTTPClient.m
//  Screenshot
//
//  Created by CoDancer on 2016/12/27.
//  Copyright © 2016年 Fm. All rights reserved.
//

#import "FMHTTPClient.h"

@interface FMHTTPClient()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation FMHTTPClient

+ (instancetype)sharedClient {
    
    static dispatch_once_t once;
    static FMHTTPClient *__singleton__;
    dispatch_once(&once, ^ {
        __singleton__ = [[self alloc] init];
    });
    return __singleton__;
}

-(AFHTTPSessionManager *)manager {
    
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer = [AFJSONResponseSerializer
                                       serializerWithReadingOptions:NSJSONReadingMutableContainers];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    }
    return _manager;
}

//服务器入口
- (NSURLSessionDataTask *)entranceGET:(NSString *)URLString
                      parameters:(id)parameters
                         success:(void (^)(NSURLSessionDataTask *, id))success
                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    
    NSMutableDictionary *parm = [NSMutableDictionary new];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [parm setObject:obj forKey:key];
    }];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",@"",URLString];
    
    return [self.manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

-(NSURLSessionDataTask *)GET:(NSString *)URLString
                  parameters:(id)parameters
                    progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                     success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                     failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    NSMutableDictionary *parm = [NSMutableDictionary new];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [parm setObject:obj forKey:key];
    }];
    NSString *url;
    url = [NSString stringWithFormat:@"%@%@",@"",URLString];
    
    return [self.manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

-(NSURLSessionDataTask *)POST:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void (^)(NSProgress * _Nonnull))uploadProgress
                      success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                      failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    return [self.manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

- (void)tagParams:(NSMutableDictionary *)params {
    
//    if (!params) {
//        params = [NSMutableDictionary dictionary];
//    }
//    NSDictionary *dictionary = [[NSBundle mainBundle] infoDictionary];
//    NSString *ver = [dictionary objectForKey:@"CFBundleShortVersionString"];
//
//    NSString *userId = [[NSUserDefaults ] objectForKey:@""];
//    NSString *userToken = [UserDefaults objectForKey:@""];
//    if (!userId) {
//        userId = @"";
//        userToken = @"";
//    }
//
//    params[@"systype"] = @"ios";
//    params[@"appversion"] = ver;
//    params[@"user_id"] = userId;
//    params[@"token"] = userToken;

}

@end
