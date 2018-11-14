//
//  SupermarketModel.m
//  HJYZG
//
//  Created by HCY on 2018/10/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SupermarketModel.h"

@implementation SupermarketSideGoods

@end

@implementation SupermarketModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"goods" : [SupermarketSideGoods class],
             };
}
@end
