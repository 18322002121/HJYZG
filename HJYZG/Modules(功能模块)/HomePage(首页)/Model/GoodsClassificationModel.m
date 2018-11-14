//
//  GoodsClassificationModel.m
//  HJYZG
//
//  Created by HCY on 2018/9/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GoodsClassificationModel.h"

@implementation GoodsClassificationModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self=[super init]) {
        self.gridTitle=dict[@"gridTitle"];
        self.iconImage=dict[@"iconImage"];
    }
    return self;
}
+ (instancetype)initWithDict:(NSDictionary *)dict{

    return [[self alloc]initWithDict:dict];
}

@end
