//
//  SelectedActivitiesModel.m
//  HJYZG
//
//  Created by HCY on 2018/9/22.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SelectedActivitiesModel.h"

@implementation SelectedActivitiesModel

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        self.image_url = dict[@"image_url"];
        self.nature = dict[@"nature"];
        self.stock = dict[@"stock"];
    }
    return self;
}

+ (instancetype)initWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}

@end
