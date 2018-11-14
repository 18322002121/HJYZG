//
//  PutForwardModel.m
//  HJYZG
//
//  Created by HCY on 2018/10/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "PutForwardModel.h"

@implementation PutForwardModel

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        self.titleLabel = dict[@"titleLabel"];
        self.inputField= dict[@"inputField"];
    }
    return self;
}

+ (instancetype)initWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}


@end
