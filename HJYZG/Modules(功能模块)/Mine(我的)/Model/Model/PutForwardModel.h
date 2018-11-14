//
//  PutForwardModel.h
//  HJYZG
//
//  Created by HCY on 2018/10/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PutForwardModel : NSObject
@property (nonatomic,strong) NSString *titleLabel;
@property (nonatomic,strong) NSString *inputField;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

