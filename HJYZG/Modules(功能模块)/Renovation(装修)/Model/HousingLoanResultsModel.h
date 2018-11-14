//
//  HousingLoanResultsModel.h
//  HJYZG
//
//  Created by HCY on 2018/10/17.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HousingLoanResultsModel : NSObject
@property (nonatomic,strong) NSString *leftTitle;
@property (nonatomic,strong) NSString *centerTitle;
@property (nonatomic,strong) NSString *rightTitle;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
