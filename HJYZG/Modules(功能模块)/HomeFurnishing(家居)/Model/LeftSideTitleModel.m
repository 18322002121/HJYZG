//
//  LeftSideTitleModel.m
//  HJYZG
//
//  Created by HCY on 2018/9/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "LeftSideTitleModel.h"

@implementation LeftSideTitleModel
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
