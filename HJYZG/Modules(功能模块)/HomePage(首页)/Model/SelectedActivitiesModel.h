//
//  SelectedActivitiesModel.h
//  HJYZG
//
//  Created by HCY on 2018/9/22.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectedActivitiesModel : NSObject
@property (nonatomic,strong) NSString *image_url;
@property (nonatomic,strong) NSString *nature;
@property (nonatomic,strong) NSString *stock;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
