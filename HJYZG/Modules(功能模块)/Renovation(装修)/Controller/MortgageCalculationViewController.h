//
//  MortgageCalculationViewController.h
//  HJYZG
//
//  Created by HCY on 2018/8/10.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "BaseViewController.h"

@interface MortgageCalculationViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

//贷款总额输入内容
@property(nonatomic,assign)double businessTotalPrice;

//商业贷款年限
@property(nonatomic,assign)double providentPeriod;

//贷款利率选择框
@property(nonatomic,assign)double commercialLoanInterestRate;

//是否展示计算结果
@property (nonatomic,assign) BOOL isShows;













////公积金贷款选择框
//@property(nonatomic,strong)NSString *housingProvidentLoan;
//
////公积金贷款年限
//@property(nonatomic,strong)NSString *commercialLoanLife;
//
////公积金贷款利率
//@property(nonatomic,strong)NSString *housingProvidentLoanInterestRate;

//首付金额
//@property(nonatomic,assign)double downPayments;









//公积金贷款首选比例
@property(nonatomic,strong)NSString *commercialLoanLifeProportion;


@end
