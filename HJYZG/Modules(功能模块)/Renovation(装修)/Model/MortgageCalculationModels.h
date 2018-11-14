//
//  MortgageCalculationModels.h
//  HJYZG
//
//  Created by HCY on 2018/8/14.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MortgageModel,MortgageResultModel;
@interface MortgageCalculationModels : NSObject

/** =================================== 商业贷款 =================================== */

#pragma mark 按商业贷款等额本息总价计算(总价)
+ (MortgageResultModel *)calculateBusinessLoanAsTotalPriceAndEqualPrincipalInterestWithCalcModel:(MortgageModel *)calcModel;
#pragma mark 按商业贷款等额本金总价计算(总价)
+ (MortgageResultModel *)calculateBusinessLoanAsTotalPriceAndEqualPrincipalWithCalcModel:(MortgageModel *)calcModel;
#pragma mark 按商业贷款等额本息单价计算(单价和面积)
+ (MortgageResultModel *)calculateBusinessLoanAsUnitPriceAndEqualPrincipalInterestWithCalcModel:(MortgageModel *)calcModel;
#pragma mark 按商业贷款等额本金单价计算(单价和面积)
+ (MortgageResultModel *)calculateBusinessLoanAsUnitPriceAndEqualPrincipalWithCalcModel:(MortgageModel *)calcModel;

/** =================================== 公积金贷款 =================================== */

#pragma mark 按公积金贷款等额本息总价计算(总价)
+ (MortgageResultModel *)calculateFundLoanAsTotalPriceAndEqualPrincipalInterestWithCalcModel:(MortgageModel *)calcModel;
#pragma mark 按公积金贷款等额本金总价计算(总价)
+ (MortgageResultModel *)calculateFundLoanAsTotalPriceAndEqualPrincipalWithCalcModel:(MortgageModel *)calcModel;
#pragma mark 按公积金贷款等额本息单价计算(单价和面积)
+ (MortgageResultModel *)calculateFundLoanAsUnitPriceAndEqualPrincipalInterestWithCalcModel:(MortgageModel *)calcModel;
#pragma mark 按公积金贷款等额本金单价计算(单价和面积)
+ (MortgageResultModel *)calculateFundLoanAsUnitPriceAndEqualPrincipalWithCalcModel:(MortgageModel *)calcModel;

/** =================================== 组合型贷款 =================================== */
#pragma mark 按组合型贷款等额本息总价计算(总价)
+ (MortgageResultModel *)calculateCombinedLoanAsTotalPriceAndEqualPrincipalInterestWithCalcModel:(MortgageModel *)calcModel;
#pragma mark 按组合型贷款等额本金总价计算(总价)
+ (MortgageResultModel *)calculateCombinedLoanAsTotalPriceAndEqualPrincipalWithCalcModel:(MortgageModel *)calcModel;

@end


@interface MortgageModel : NSObject
/** 单价 */
@property (nonatomic, assign) double unitPrice;
/** 面积 */
@property (nonatomic, assign) double area;
/** 商业贷款总额 */
@property (nonatomic, assign) double businessTotalPrice;
/** 公积金贷款总额 */
@property (nonatomic, assign) double fundTotalPrice;
/** 按揭年数 */
@property (nonatomic, assign) int mortgageYear;
/** 按揭成数 */
@property (nonatomic, assign) int mortgageMulti;
/** 银行利率 */
@property (nonatomic, assign) double bankRate;
/** 公积金利率 */
@property (nonatomic, assign) double fundRate;

@end


@interface MortgageResultModel : NSObject
// 房屋总价
@property (nonatomic, assign) double houseTotalPrice;
/** 贷款总额 */
@property (nonatomic, assign) double loanTotalPrice;
/** 还款总额 */
@property (nonatomic, assign) double repayTotalPrice;
/** 支付利息 */
@property (nonatomic, assign) double interestPayment;
/** 按揭年数 */
@property (nonatomic, assign) double mortgageYear;
/** 按揭月数 */
@property (nonatomic, assign) double mortgageMonth;
/** 月均还款 */
@property (nonatomic, assign) double avgMonthRepayment;
/** 首月还款 */
@property (nonatomic, assign) double firstMonthRepayment;
/** 每月还款数组 */
@property (nonatomic, strong) NSMutableArray *monthRepaymentArr;

/** 等额本息月供利息数组 */
@property (nonatomic, strong) NSMutableArray *monthlyInterestRate;
/** 等额本息月供本金数组 */
@property (nonatomic, strong) NSMutableArray *yuehuanbenjinArr;
/** 等额本息剩余贷款数组 */
@property (nonatomic, strong) NSMutableArray *shengyudaikuanArr;


/** 等额本金每月递减 */
@property (nonatomic, assign) double monthlyDecline;

@end



