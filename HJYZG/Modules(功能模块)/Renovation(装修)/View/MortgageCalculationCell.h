//
//  MortgageCalculationCell.h
//  HJYZG
//
//  Created by HCY on 2018/10/14.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MortgageCalculationCell : UITableViewCell
@property (nonatomic,strong) PublicLabel *leftTitle;
@property (nonatomic,strong) PublicButton *rightButton;
@property (nonatomic,strong) void (^rightClickBlock)(UIButton *sender);
@end
