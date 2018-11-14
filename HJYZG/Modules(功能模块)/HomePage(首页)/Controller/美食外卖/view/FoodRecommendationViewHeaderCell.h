//
//  FoodRecommendationViewHeaderCell.h
//  HJYZG
//
//  Created by HCY on 2018/10/9.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^specificationsClick)(UIButton *sender);
@interface FoodRecommendationViewHeaderCell : UITableViewCell
@property (nonatomic,strong) specificationsClick specificationsButton;
@end
