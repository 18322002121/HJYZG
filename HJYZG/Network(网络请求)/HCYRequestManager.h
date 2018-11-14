//
//  HCYRequestManager.h
//  mayizhisheng
//
//  Created by HCY on 2018/8/20.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HCYRequestManager : NSObject
/** 检查用户名 */
+ (void)appCheckNameUsername:(NSString *)username success:(void (^)(id responseObject))success failure:(void (^)(NSError * errorMessage))failure;

/** 检查手机号 */
+ (void)appCheckMobileMobile:(NSString *)mobile success:(void (^)(id responseObject))success failure:(void (^)(NSError * errorMessage))failure;

/** 检查email */
+ (void)appCheckEmailEmail:(NSString *)email success:(void (^)(id responseObject))success failure:(void (^)(NSError * errorMessage))failure;

/** 注册提交 */
+ (void)appRegisterMethodUsername:(NSString *)username password:(NSString *)password email:(NSString *)email mobile:(NSString *)mobile success:(void (^)(id responseObject))success failure:(void (^)(NSError * errorMessage))failure;

/** 登陆 */
+ (void)appLoginUsername:(NSString *)username password:(NSString *)password success:(void (^)(id responseObject))success failure:(void (^)(NSError * errorMessage))failure;

/** 首页广告位 */
+ (void)topAdSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError * errorMessage))failure;


@end
