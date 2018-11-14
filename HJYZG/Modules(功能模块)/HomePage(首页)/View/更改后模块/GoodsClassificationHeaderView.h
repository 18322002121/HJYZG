//
//  GoodsClassificationHeaderView.h
//  HJYZG
//
//  Created by HCY on 2018/9/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^didSelectItemAtIndex)(NSInteger index);
@interface GoodsClassificationHeaderView : UICollectionReusableView
@property (nonatomic,strong) NSArray *bannerArray;
@property (nonatomic,strong) didSelectItemAtIndex indexShow;
@end
