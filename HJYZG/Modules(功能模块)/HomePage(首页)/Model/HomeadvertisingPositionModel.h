//
//  HomeadvertisingPositionModel.h
//  HJYZG
//
//  Created by HCY on 2018/11/9.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscountList :NSObject
@property (nonatomic , copy) NSString              * path;
@property (nonatomic , copy) NSString              * adpositionName;
@property (nonatomic , copy) NSString              * storeId;
@property (nonatomic , copy) NSString              * productId;

@end

@interface HotList :NSObject
@property (nonatomic , copy) NSString              * path;
@property (nonatomic , copy) NSString              * adpositionName;
@property (nonatomic , copy) NSString              * storeId;
@property (nonatomic , copy) NSString              * productId;
@end

@interface ProductList :NSObject
@property (nonatomic , copy) NSString              * path;
@property (nonatomic , copy) NSString              * adpositionName;
@property (nonatomic , copy) NSString              * storeId;
@property (nonatomic , copy) NSString              * productId;

@end

@interface Bannerlist :NSObject
@property (nonatomic , copy) NSString              * path;
@property (nonatomic , copy) NSString              * adpositionName;
@property (nonatomic , copy) NSString              * storeId;
@property (nonatomic , copy) NSString              * productId;

@end

@interface HomeData :NSObject
@property (nonatomic , copy) NSArray<DiscountList *>              * discountList;
@property (nonatomic , copy) NSArray<HotList *>              * hotList;
@property (nonatomic , copy) NSArray<ProductList *>              * productList;
@property (nonatomic , copy) NSArray<Bannerlist *>              * bannerlist;

@end

@interface HomeadvertisingPositionModel :NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , strong) HomeData              * data;
@property (nonatomic , copy) NSString              * code;

@end
