//
//  HCYRequestUrl.h
//  mayizhisheng
//
//  Created by HCY on 2018/8/20.
//  Copyright © 2018年 HCY. All rights reserved.
//

#ifndef HCYRequestUrl_h
#define HCYRequestUrl_h


//#pragma mark-正式库
//#define API_HOST @"http://www.lingqidian.net/formal"


#pragma mark-测试库
#define API_HOST @"http://192.168.1.131:8080/appInterface/"


//检查用户名
#define appCheckName [NSString stringWithFormat:@"%@AppRegister/appCheckName",API_HOST]

//检查手机号
#define appCheckMobile [NSString stringWithFormat:@"%@AppRegister/appCheckMobile",API_HOST]

//检查email
#define appCheckEmail [NSString stringWithFormat:@"%@AppRegister/appCheckEmail",API_HOST]

//注册提交
#define appRegisterMethod [NSString stringWithFormat:@"%@AppRegister/appRegisterMethod",API_HOST]

//登陆
#define appLogin [NSString stringWithFormat:@"%@appLogin/appLogin",API_HOST]

//首页广告位
#define topAd [NSString stringWithFormat:@"%@appAd/topAd",API_HOST]





#endif /* HCYRequestUrl_h */
