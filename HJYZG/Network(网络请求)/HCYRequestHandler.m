//
//  HCYRequestHandler.m
//  mayizhisheng
//
//  Created by HCY on 2018/8/20.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HCYRequestHandler.h"

@interface HCYRequestHandler ()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@end
@implementation HCYRequestHandler
static HCYRequestHandler *requestManager = nil;
+ (instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!requestManager) {
            requestManager = [[HCYRequestHandler alloc] init];
        }
    });
    return requestManager;
}

- (instancetype)init{
    if (self = [super init] ) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        _sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _sessionManager.requestSerializer.timeoutInterval = 10.0;// 设置超时时间
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                                          @"text/html",
                                                                                          @"text/json",
                                                                                          @"text/plain",
                                                                                          @"text/javascript",
                                                                                          @"text/xml",
                                                                                          @"image/*",
                                                                                          @"application/octet-stream",
                                                                                          @"application/zip"]];// 设置响应内容的类型
        
    }
    return self;
}

- (void)GET:(NSString *)URLString parameters:(id)parameters success:(HCYHttpRequestSuccess)success failure:(HCYHttpRequestFailed)failure{

    [self.sessionManager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)POST:(NSString *)URLString parameters:(id)parameters success:(HCYHttpRequestSuccess)success failure:(HCYHttpRequestFailed)failure{
    [self.sessionManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}


- (void)sendRequestServerUrl:(NSString *)URLString requestheaderType:(HCYRequestheaderType)requestheaderType parameters:(id)parameters
                     success:(HCYHttpRequestSuccess)success
                     failure:(HCYHttpRequestFailed)failure{
    switch (requestheaderType)  {
        case HCYRequestheaderTypeGet:
        {
            [_sessionManager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case HCYRequestheaderTypePost:
        {
            [_sessionManager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
    }

}


@end
