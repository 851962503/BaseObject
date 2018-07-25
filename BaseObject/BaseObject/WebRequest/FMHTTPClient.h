//
//  FMHTTPClient.h
//  Screenshot
//
//  Created by CoDancer on 2016/12/27.
//  Copyright © 2016年 Fm. All rights reserved.
//

@interface FMHTTPClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (NSURLSessionDataTask *)entranceGET:(NSString *)URLString
                             parameters:(id)parameters
                                success:(void (^)(NSURLSessionDataTask *, id))success
                                failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

- (NSURLSessionDataTask *)entrancePOST:(NSString *)URLString
                           parameters:(id)parameters
                              success:(void (^)(NSURLSessionDataTask *, id))success
                              failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

- (void)tagParams:(NSMutableDictionary *)params;

@end
