//
//  ReimbursementViewController.h
//  HJYZG
//
//  Created by HCY on 2018/9/10.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "BaseViewController.h"

@interface ReimbursementViewController : BaseViewController

//贷款总额
@property(nonatomic,assign)double totalLoan;
//利息总额
@property(nonatomic,assign)double totalInterest;
//等额本金数组
@property (nonatomic,strong) NSArray *capitalResultArray;
//等额本息数组
@property (nonatomic,strong) NSArray *interestResultArray;
//等额本息利息数组
@property (nonatomic,strong) NSArray *monthlyInterestRate;
//等额本息月供本金数组
@property (nonatomic,strong) NSArray *yuehuanbenjinArr;
//等额本息剩余贷款
@property (nonatomic,strong) NSArray *shengyudaikuanArr;

@end
