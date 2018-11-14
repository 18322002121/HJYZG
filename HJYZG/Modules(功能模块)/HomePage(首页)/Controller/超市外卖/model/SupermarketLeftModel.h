//
//  SupermarketLeftModel.h
//  HJYZG
//
//  Created by HCY on 2018/10/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SupermarketLeftModel : NSObject

@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * fileName;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
