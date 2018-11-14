//
//  HomePageMainCell.h
//  HJYZG
//
//  Created by HCY on 2018/8/17.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageMainCell : UITableViewCell
@property(nonatomic,strong)void (^classifiedAreaButton)(UIButton *sender);
@property(nonatomic,strong)void (^activityButton)(UIButton *sender);
@end
