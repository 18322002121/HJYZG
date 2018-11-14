//
//  SupermarketModel.h
//  HJYZG
//
//  Created by HCY on 2018/10/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SupermarketSideGoods : NSObject
@property (nonatomic , copy) NSString              * goods_title;
@property (nonatomic , copy) NSString              * image_url;

@end

@interface SupermarketModel :NSObject
@property (nonatomic , copy) NSArray<SupermarketSideGoods *>              * goods;
@property (nonatomic , copy) NSString              * title;
@end



