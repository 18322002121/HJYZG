//
//  HomeadvertisingPositionModel.m
//  HJYZG
//
//  Created by HCY on 2018/11/9.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HomeadvertisingPositionModel.h"

@implementation DiscountList

@end
@implementation HotList

@end
@implementation ProductList

@end
@implementation Bannerlist

@end
@implementation HomeData
+ (NSDictionary *)modelContainerPropertyGenericClass {

    return @{@"discountList" : [DiscountList class],
             @"hotList" : [HotList class],
             @"productList" : [ProductList class],
             @"bannerlist" : [Bannerlist class],
             };
}
@end
@implementation HomeadvertisingPositionModel
+ (NSDictionary *)modelContainerPropertyGenericClass {

    return @{@"data" : [HomeData class],

             };
}
@end
