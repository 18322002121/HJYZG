//
//  MortgageCalculationResultCell.h
//  HJYZG
//
//  Created by HCY on 2018/10/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HousingLoanResultsModel;
@interface MortgageCalculationResultCell : UITableViewCell
@property (nonatomic,strong) PublicLabel *leftTitle;
@property (nonatomic,strong) PublicLabel *centerTitle;
@property (nonatomic,strong) PublicLabel *rightTitle;
@property (nonatomic,strong) HousingLoanResultsModel *loanResultsModel;
@end
