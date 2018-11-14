//
//  MainSideTitleModel.h
//  HJYZG
//
//  Created by HCY on 2018/9/16.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainSideGoods :NSObject
@property (nonatomic , copy) NSString              * goods_title;
@property (nonatomic , copy) NSString              * image_url;

@end

@interface MainSideTitleModel :NSObject
@property (nonatomic , copy) NSArray<MainSideGoods *>              * goods;
@property (nonatomic , copy) NSString              * title;

@end
