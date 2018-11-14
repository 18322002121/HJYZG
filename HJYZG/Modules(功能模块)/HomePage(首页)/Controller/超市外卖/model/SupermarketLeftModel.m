//
//  SupermarketLeftModel.m
//  HJYZG
//
//  Created by HCY on 2018/10/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SupermarketLeftModel.h"

@implementation SupermarketLeftModel
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.fileName= dict[@"fileName"];
    }
    return self;
}

+ (instancetype)initWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}
@end
