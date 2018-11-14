//
//  HousingLoanResultsModel.m
//  HJYZG
//
//  Created by HCY on 2018/10/17.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HousingLoanResultsModel.h"

@implementation HousingLoanResultsModel

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        self.leftTitle = dict[@"leftTitle"];
        self.centerTitle = dict[@"centerTitle"];
        self.rightTitle = dict[@"rightTitle"];
    }
    return self;
}

+ (instancetype)initWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}


@end
