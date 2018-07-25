//
//  GPAPIHeader.h
//  GraduationProject
//
//  Created by CoDancer on 15/12/13.
//  Copyright © 2015年 onwer. All rights reserved.
//


#ifndef GPAPIHeader_h
#define GPAPIHeader_h

typedef void (^YQHTTPClientSuccessBlock)(id responseObject);
typedef void (^YQHTTPClientFailureBlock)(NSError *error);


#define YQ_HTTP_FAILURE ^(NSURLSessionTask *operation, NSError *error) { \
if (failure) { \
failure(error); \
}\
}

#define YQ_DEFAULT_API(METHOD) \
- (AFHTTPSessionManager*)METHOD ## Success:(YQHTTPClientSuccessBlock)success failure:(YQHTTPClientFailureBlock)failure
#define YQ_DEFAULT_PARAMS_API(METHOD) \
- (NSURLSessionDataTask*)METHOD success:(YQHTTPClientSuccessBlock)success failure:(YQHTTPClientFailureBlock)failure

#define YQ_DEFAULT_CACHEDATA_API(METHOD) \
- (AFHTTPSessionManager*)METHOD ## Success:(YQHTTPClientSuccessBlock)success failure:(YQHTTPClientFailureBlock)failure
#define YQ_DEFAULT_CACHEDATA_PARAMS_API(METHOD) \
- (AFHTTPSessionManager*)METHOD success:(YQHTTPClientSuccessBlock)success failure:(FMHTTPClientFailureWithCacheDataBlock)failure

#endif /* GPAPIHeader_h */
