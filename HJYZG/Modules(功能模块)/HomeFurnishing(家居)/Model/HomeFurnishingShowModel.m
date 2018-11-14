//
//  HomeFurnishingShowModel.m
//  HJYZG
//
//  Created by HCY on 2018/8/27.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HomeFurnishingShowModel.h"


@implementation HomeFurnishingShowModel


- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        self.sale_count = dict[@"sale_count"];
        self.main_title = dict[@"main_title"];
        self.sales = dict[@"sales"];
        self.image_url = dict[@"image_url"];
        self.price = dict[@"price"];
        self.stock = dict[@"stock"];
        self.goods_address = dict[@"goods_address"];
        self.goods_title = dict[@"goods_title"];
        self.expressage = dict[@"expressage"];
    }
    return self;
}

+ (instancetype)initWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}


@end

