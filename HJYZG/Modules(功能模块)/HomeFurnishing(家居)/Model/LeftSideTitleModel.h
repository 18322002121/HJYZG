//
//  LeftSideTitleModel.h
//  HJYZG
//
//  Created by HCY on 2018/9/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeftSideTitleModel : NSObject
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * fileName;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
