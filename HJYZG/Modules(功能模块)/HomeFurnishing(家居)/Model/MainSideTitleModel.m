//
//  MainSideTitleModel.m
//  HJYZG
//
//  Created by HCY on 2018/9/16.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MainSideTitleModel.h"

@implementation MainSideGoods

@end
@implementation MainSideTitleModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"goods" : [MainSideGoods class],
            };
}

@end


