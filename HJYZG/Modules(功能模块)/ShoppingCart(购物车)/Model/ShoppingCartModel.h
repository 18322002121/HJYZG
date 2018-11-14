//
//  ShoppingCartModel.h
//  HJYZG
//
//  Created by HCY on 2018/9/6.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goods :NSObject
@property (nonatomic , copy) NSString              * iid;
@property (nonatomic , copy) NSString              * realPrice;
@property (nonatomic , copy) NSString              * goodsType;
@property (nonatomic , copy) NSString              * count;
@property (nonatomic , copy) NSString              * orginalPrice;
@property (nonatomic , copy) NSString              * total;
@property (nonatomic , copy) NSString              * userId;
@property (nonatomic , copy) NSString              * sid;
@property (nonatomic , copy) NSString              * goodsName;
@property (nonatomic , copy) NSString              * shopId;
@property (nonatomic , copy) NSString              * goodsId;
@property (nonatomic , copy) NSString              * shopName;
@property (nonatomic , copy) NSString              * categoryId;

@end

@interface Data :NSObject
@property (nonatomic , copy) NSString              * idd;
@property (nonatomic , copy) NSString              * shopName;
@property (nonatomic , copy) NSString              * sid;
@property (nonatomic , copy) NSArray<Goods *>              * goods;

@end

@interface ShoppingCartModel :NSObject
@property (nonatomic , copy) NSString              * success;
@property (nonatomic , copy) NSArray<Data *>              * data;

@end
