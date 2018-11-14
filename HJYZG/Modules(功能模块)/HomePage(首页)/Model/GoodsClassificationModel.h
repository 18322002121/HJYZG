//
//  GoodsClassificationModel.h
//  HJYZG
//
//  Created by HCY on 2018/9/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsClassificationModel : NSObject
@property (nonatomic,strong) NSString *gridTitle;
@property (nonatomic,strong) NSString *iconImage;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)initWithDict:(NSDictionary *)dict;

@end
