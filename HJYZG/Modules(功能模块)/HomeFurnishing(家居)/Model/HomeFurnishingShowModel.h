//
//  HomeFurnishingShowModel.h
//  HJYZG
//
//  Created by HCY on 2018/8/27.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeFurnishingShowModel :NSObject
@property (nonatomic , copy) NSArray<NSString *>              * images;
@property (nonatomic , copy) NSString              * sale_count;
@property (nonatomic , copy) NSString              * main_title;
@property (nonatomic , copy) NSString              * sales;
@property (nonatomic , copy) NSString              * image_url;
@property (nonatomic , copy) NSString              * price;
@property (nonatomic , copy) NSString              * stock;
@property (nonatomic , copy) NSString              * goods_address;
@property (nonatomic , copy) NSString              * goods_title;
@property (nonatomic , copy) NSString              * expressage;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
