//
//  MortgageCalculationTwoCell.h
//  HJYZG
//
//  Created by HCY on 2018/10/14.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MortgageCalculationTwoCell : UITableViewCell
@property (nonatomic,strong) PublicLabel *leftTwoTitle;
@property (nonatomic,strong) PublicTextfield *centerTextfield;
@property (nonatomic,strong) PublicLabel *rightTwoTitle;

@property (nonatomic,strong) void (^reloadTextfield)(UITextField *textField);
@end
