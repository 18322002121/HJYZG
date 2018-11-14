//
//  MortgageCalculationModels.m
//  HJYZG
//
//  Created by HCY on 2018/8/14.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MortgageCalculationModels.h"

@implementation MortgageCalculationModels

/** =================================== 商业贷款 =================================== */
#pragma mark - 商业贷款
#pragma mark 按商业贷款等额本息总价计算(总价)
+ (MortgageResultModel *)calculateBusinessLoanAsTotalPriceAndEqualPrincipalInterestWithCalcModel:(MortgageModel *)calcModel {
    NSLog(@"按商业贷款等额本息总价计算(总价)");
    // 贷款总额
    double loanTotalPrice = calcModel.businessTotalPrice * 10000;
    // 贷款月数
    int loanMonthCount = calcModel.mortgageYear * 12;
    // 月利率
    double monthRate = calcModel.bankRate / 100.0 / 12.0;
    // 每月还款
    double avgMonthRepayment = loanTotalPrice*monthRate*powf(1+monthRate, loanMonthCount)/(powf(1+monthRate, loanMonthCount)-1);
    
    // 还款总额
    double repayTotalPrice = avgMonthRepayment*loanMonthCount;
    // 支付利息
    double interestPayment = repayTotalPrice-loanTotalPrice;
    
    // 每月还款数组
    NSMutableArray *monthRepaymentArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<loanMonthCount; i++) {
        [monthRepaymentArr addObject:[NSString stringWithFormat:@"%.2f", avgMonthRepayment]];
    }
    //每月应还利息
    NSMutableArray *yuehuanlixiArr = [NSMutableArray arrayWithCapacity:0];//月还利息数组
    NSMutableArray *yuehuanbenjinArr = [NSMutableArray arrayWithCapacity:0];//月还本金数组
    NSMutableArray *shengyudaikuanArr = [NSMutableArray arrayWithCapacity:0];//剩余贷款数组
    for (int i = 1; i<=loanMonthCount; i++) {
        double aa = powf(1+monthRate,loanMonthCount);
        double bb = powf(1+monthRate, i-1);
        [yuehuanlixiArr addObject:[NSString stringWithFormat:@"%.2f",loanTotalPrice *monthRate * (aa - bb) / (aa - 1) ]];
        [yuehuanbenjinArr addObject:[NSString stringWithFormat:@"%.2f",loanTotalPrice *monthRate * bb / (aa - 1)]];
        [shengyudaikuanArr addObject:[NSString stringWithFormat:@"%.2f",repayTotalPrice-avgMonthRepayment *i]];
    }
    NSLog(@"%@",shengyudaikuanArr);

    MortgageResultModel *resultModel = [MortgageResultModel new];
    resultModel.loanTotalPrice           = loanTotalPrice;
    resultModel.repayTotalPrice          = repayTotalPrice;
    resultModel.interestPayment          = interestPayment;
    resultModel.mortgageYear             = calcModel.mortgageYear;
    resultModel.mortgageMonth            = loanMonthCount;
    resultModel.avgMonthRepayment        = avgMonthRepayment;
    resultModel.firstMonthRepayment      = [[monthRepaymentArr firstObject] doubleValue];
    resultModel.monthRepaymentArr        = monthRepaymentArr;
    resultModel.monthlyInterestRate      = yuehuanlixiArr;
    resultModel.yuehuanbenjinArr         = yuehuanbenjinArr;
    resultModel.shengyudaikuanArr        = shengyudaikuanArr;
    return resultModel;
}
#pragma mark 按商业贷款等额本金总价计算(总价)
+ (MortgageResultModel *)calculateBusinessLoanAsTotalPriceAndEqualPrincipalWithCalcModel:(MortgageModel *)calcModel {
    NSLog(@"按商业贷款等额本金总价计算(总价)");
    // 每月还款数组
    NSMutableArray *monthRepaymentArr = [[NSMutableArray alloc] init];
    // 贷款总额
    double loanTotalPrice = calcModel.businessTotalPrice * 10000;
    // 月利率
    double monthRate = calcModel.bankRate / 100.0 / 12.0;
    // 贷款月数
    int loanMonthCount = calcModel.mortgageYear * 12;
    // 每月所还本金（每月还款）
    double avgMonthPrincipalRepayment = loanTotalPrice / loanMonthCount;
    // 还款总额
    double repayTotalPrice = 0;
    for (int i             = 0; i<loanMonthCount; i++) {
        // 每月还款
        // 公式：每月还款 + (贷款总额-每月还款*i) * 月利率
        double monthRepayment = avgMonthPrincipalRepayment
        + (loanTotalPrice - avgMonthPrincipalRepayment * i)
        * monthRate;
        [monthRepaymentArr addObject:[NSString stringWithFormat:@"%f", monthRepayment]];
        repayTotalPrice += monthRepayment;
    }
    double monthlyDecline = loanTotalPrice/loanMonthCount*monthRate;
    // 支付利息
    double interestPayment = repayTotalPrice-loanTotalPrice;
    MortgageResultModel *resultModel = [MortgageResultModel new];
    resultModel.loanTotalPrice           = loanTotalPrice;
    resultModel.repayTotalPrice          = repayTotalPrice;
    resultModel.interestPayment          = interestPayment;
    resultModel.mortgageYear             = calcModel.mortgageYear;
    resultModel.mortgageMonth            = loanMonthCount;
    resultModel.avgMonthRepayment        = [[monthRepaymentArr firstObject] doubleValue];;
    resultModel.firstMonthRepayment      = avgMonthPrincipalRepayment;
    resultModel.monthlyDecline         = monthlyDecline;
    return resultModel;
}
#pragma mark 按商业贷款等额本息单价计算(单价和面积)
+ (MortgageResultModel *)calculateBusinessLoanAsUnitPriceAndEqualPrincipalInterestWithCalcModel:(MortgageModel *)calcModel {
    NSLog(@"按商业贷款等额本息单价计算(单价和面积)");
    // 房屋总价
    double houseTotalPrice = calcModel.unitPrice * calcModel.area;
    // 贷款总额
    double loanTotalPrice = houseTotalPrice * calcModel.mortgageMulti / 10.0;
    // 首月还款
    double firstMonthRepayment = houseTotalPrice - loanTotalPrice;
    // 贷款月数
    int loanMonthCount = calcModel.mortgageYear * 12;
    // 月利率
    double monthRate = calcModel.bankRate / 100.0 / 12.0;
    // 每月还款
    double avgMonthRepayment = loanTotalPrice*monthRate*powf(1+monthRate, loanMonthCount)/(powf(1+monthRate, loanMonthCount)-1);
    // 还款总额
    double repayTotalPrice = avgMonthRepayment*loanMonthCount;
    // 支付利息
    double interestPayment = repayTotalPrice-loanTotalPrice;
    
    // 每月还款数组
    NSMutableArray *monthRepaymentArr = [[NSMutableArray alloc] init];
    for (int i = 0; i<loanMonthCount; i++) {
        [monthRepaymentArr addObject:[NSString stringWithFormat:@"%f", avgMonthRepayment]];
    }
    
    MortgageResultModel *resultModel = [MortgageResultModel new];
    resultModel.houseTotalPrice          = houseTotalPrice;
    resultModel.loanTotalPrice           = loanTotalPrice;
    resultModel.repayTotalPrice          = repayTotalPrice;
    resultModel.interestPayment          = interestPayment;
    resultModel.mortgageYear             = calcModel.mortgageYear;
    resultModel.mortgageMonth            = loanMonthCount;
    resultModel.avgMonthRepayment        = avgMonthRepayment;
    resultModel.firstMonthRepayment      = firstMonthRepayment;
    resultModel.monthRepaymentArr        = monthRepaymentArr;
    return resultModel;
}
#pragma mark 按商业贷款等额本金单价计算(单价和面积)
+ (MortgageResultModel *)calculateBusinessLoanAsUnitPriceAndEqualPrincipalWithCalcModel:(MortgageModel *)calcModel {
    NSLog(@"按商业贷款等额本金单价计算(单价和面积)");
    // 每月还款数组
    NSMutableArray *monthRepaymentArr = [[NSMutableArray alloc] init];
    // 贷款月数
    int loanMonthCount = calcModel.mortgageYear * 12;
    // 每月所还本金（每月还款）
    double avgMonthPrincipalRepayment = calcModel.unitPrice * calcModel.area * calcModel
    .mortgageMulti / 10.0 / loanMonthCount;
    // 房屋总价
    double houseTotalPrice = calcModel.unitPrice * calcModel.area;
    // 贷款总额
    double loanTotalPrice = houseTotalPrice * calcModel.mortgageMulti / 10.0;
    // 还款总额
    double repayTotalPrice = 0;
    for (int i             = 0; i<loanMonthCount; i++) {
        // 每月还款
        // 公式：每月还款 + (单价*面积*按揭成数-每月还款*i) * 月利率
        double monthRepayment = avgMonthPrincipalRepayment
        +(calcModel.unitPrice * calcModel.area * calcModel.mortgageMulti / 10.0 - avgMonthPrincipalRepayment * i)
        *(calcModel.bankRate / 100 / 12.0);
        [monthRepaymentArr addObject:[NSString stringWithFormat:@"%f", monthRepayment]];
        repayTotalPrice += monthRepayment;
    }
    // 支付利息
    double interestPayment = repayTotalPrice-loanTotalPrice;
    // 首月还款
    double firstMonthRepayment = houseTotalPrice - loanTotalPrice;
    
    MortgageResultModel *resultModel = [MortgageResultModel new];
    resultModel.houseTotalPrice          = houseTotalPrice;
    resultModel.loanTotalPrice           = loanTotalPrice;
    resultModel.repayTotalPrice          = repayTotalPrice;
    resultModel.interestPayment          = interestPayment;
    resultModel.mortgageYear             = calcModel.mortgageYear;
    resultModel.mortgageMonth            = loanMonthCount;
    resultModel.avgMonthRepayment        = avgMonthPrincipalRepayment;
    resultModel.firstMonthRepayment      = firstMonthRepayment;
    return resultModel;
}


/** =================================== 公积金贷款 =================================== */
#pragma mark - 公积金贷款
#pragma mark 按公积金贷款等额本息总价计算(总价)
+ (MortgageResultModel *)calculateFundLoanAsTotalPriceAndEqualPrincipalInterestWithCalcModel:(MortgageModel *)calcModel {
    NSLog(@"按公积金贷款等额本息总价计算(总价)");
    // 贷款总额
    double loanTotalPrice = calcModel.fundTotalPrice;
    // 贷款月数
    int loanMonthCount = calcModel.mortgageYear * 12;
    // 月利率
    double monthRate = calcModel.fundRate / 100.0 / 12.0;
    // 每月还款
    double avgMonthRepayment = loanTotalPrice*monthRate*powf(1+monthRate, loanMonthCount)/(powf(1+monthRate, loanMonthCount)-1);
    // 还款总额
    double repayTotalPrice = avgMonthRepayment*loanMonthCount;
    // 支付利息
    double interestPayment = repayTotalPrice-loanTotalPrice;
    
    // 每月还款数组
    NSMutableArray *monthRepaymentArr = [[NSMutableArray alloc] init];
    for (int i = 0; i<loanMonthCount; i++) {
        [monthRepaymentArr addObject:[NSString stringWithFormat:@"%f", avgMonthRepayment]];
    }
    
    MortgageResultModel *resultModel = [MortgageResultModel new];
    resultModel.loanTotalPrice           = loanTotalPrice;
    resultModel.repayTotalPrice          = repayTotalPrice;
    resultModel.interestPayment          = interestPayment;
    resultModel.mortgageYear             = calcModel.mortgageYear;
    resultModel.mortgageMonth            = loanMonthCount;
    resultModel.avgMonthRepayment        = avgMonthRepayment;
    resultModel.firstMonthRepayment      = [[monthRepaymentArr firstObject] doubleValue];;
    resultModel.monthRepaymentArr        = monthRepaymentArr;
    return resultModel;
}
#pragma mark 按公积金贷款等额本金总价计算(总价)
+ (MortgageResultModel *)calculateFundLoanAsTotalPriceAndEqualPrincipalWithCalcModel:(MortgageModel *)calcModel {
    NSLog(@"按公积金贷款等额本金总价计算(总价)");
    // 每月还款数组
    NSMutableArray *monthRepaymentArr = [[NSMutableArray alloc] init];
    // 贷款总额
    double loanTotalPrice = calcModel.fundTotalPrice;
    // 月利率
    double monthRate = calcModel.fundRate / 100.0 / 12.0;
    // 贷款月数
    int loanMonthCount = calcModel.mortgageYear * 12;
    // 每月所还本金（每月还款）
    double avgMonthPrincipalRepayment = loanTotalPrice / loanMonthCount;
    // 还款总额
    double repayTotalPrice = 0;
    for (int i             = 0; i<loanMonthCount; i++) {
        // 每月还款
        // 公式：每月还款 + (贷款总额-每月还款*i) * 月利率
        double monthRepayment = avgMonthPrincipalRepayment
        + (loanTotalPrice - avgMonthPrincipalRepayment * i)
        * monthRate;
        [monthRepaymentArr addObject:[NSString stringWithFormat:@"%f", monthRepayment]];
        repayTotalPrice += monthRepayment;
    }
    // 支付利息
    double interestPayment = repayTotalPrice - calcModel.fundTotalPrice;
    
    MortgageResultModel *resultModel = [MortgageResultModel new];
    resultModel.loanTotalPrice           = loanTotalPrice;
    resultModel.repayTotalPrice          = repayTotalPrice;
    resultModel.interestPayment          = interestPayment;
    resultModel.mortgageYear             = calcModel.mortgageYear;
    resultModel.mortgageMonth            = loanMonthCount;
    resultModel.avgMonthRepayment        = avgMonthPrincipalRepayment;
    resultModel.firstMonthRepayment      = [[monthRepaymentArr firstObject] doubleValue];;
    resultModel.monthRepaymentArr        = monthRepaymentArr;
    return resultModel;
}
#pragma mark 按公积金贷款等额本息单价计算(单价和面积)
+ (MortgageResultModel *)calculateFundLoanAsUnitPriceAndEqualPrincipalInterestWithCalcModel:(MortgageModel *)calcModel {
    NSLog(@"按公积金贷款等额本息单价计算(单价和面积)");
    // 房屋总价
    double houseTotalPrice = calcModel.unitPrice * calcModel.area;
    // 贷款总额
    double loanTotalPrice = houseTotalPrice * calcModel.mortgageMulti / 10.0;
    // 首月还款
    double firstMonthRepayment = houseTotalPrice - loanTotalPrice;
    // 贷款月数
    int loanMonthCount = calcModel.mortgageYear * 12;
    // 月利率
    double monthRate = calcModel.fundRate / 100.0 / 12.0;
    // 每月还款
    double avgMonthRepayment = loanTotalPrice*monthRate*powf(1+monthRate, loanMonthCount)/(powf(1+monthRate, loanMonthCount)-1);
    // 还款总额
    double repayTotalPrice = avgMonthRepayment*loanMonthCount;
    // 支付利息
    double interestPayment = repayTotalPrice-loanTotalPrice;
    
    // 每月还款数组
    NSMutableArray *monthRepaymentArr = [[NSMutableArray alloc] init];
    for (int i = 0; i<loanMonthCount; i++) {
        [monthRepaymentArr addObject:[NSString stringWithFormat:@"%f", avgMonthRepayment]];
    }
    
    MortgageResultModel *resultModel = [MortgageResultModel new];
    resultModel.houseTotalPrice          = houseTotalPrice;
    resultModel.loanTotalPrice           = loanTotalPrice;
    resultModel.repayTotalPrice          = repayTotalPrice;
    resultModel.interestPayment          = interestPayment;
    resultModel.mortgageYear             = calcModel.mortgageYear;
    resultModel.mortgageMonth            = loanMonthCount;
    resultModel.avgMonthRepayment        = avgMonthRepayment;
    resultModel.firstMonthRepayment      = firstMonthRepayment;
    resultModel.monthRepaymentArr        = monthRepaymentArr;
    return resultModel;
}
#pragma mark 按公积金贷款等额本金单价计算(单价和面积)
+ (MortgageResultModel *)calculateFundLoanAsUnitPriceAndEqualPrincipalWithCalcModel:(MortgageModel *)calcModel {
    NSLog(@"按公积金贷款等额本金单价计算(单价和面积)");
    // 每月还款数组
    NSMutableArray *monthRepaymentArr = [[NSMutableArray alloc] init];
    // 贷款月数
    int loanMonthCount = calcModel.mortgageYear * 12;
    // 每月所还本金（每月还款）
    double avgMonthPrincipalRepayment = calcModel.unitPrice * calcModel.area * calcModel
    .mortgageMulti / 10.0 / loanMonthCount;
    // 房屋总价
    double houseTotalPrice = calcModel.unitPrice * calcModel.area;
    // 贷款总额
    double loanTotalPrice = houseTotalPrice * calcModel.mortgageMulti / 10.0;
    // 月利率
    double monthRate = calcModel.fundRate / 100.0 / 12.0;
    // 还款总额
    double repayTotalPrice = 0;
    for (int i             = 0; i<loanMonthCount; i++) {
        // 每月还款
        // 公式：每月还款 + (单价*面积*按揭成数-每月还款*i) * 月利率
        double monthRepayment = avgMonthPrincipalRepayment
        +(calcModel.unitPrice * calcModel.area * calcModel.mortgageMulti / 10.0 - avgMonthPrincipalRepayment * i)
        *monthRate;
        [monthRepaymentArr addObject:[NSString stringWithFormat:@"%f", monthRepayment]];
        repayTotalPrice += monthRepayment;
    }
    // 支付利息
    double interestPayment = repayTotalPrice-loanTotalPrice;
    // 首月还款
    double firstMonthRepayment = houseTotalPrice - loanTotalPrice;
    
    MortgageResultModel *resultModel = [MortgageResultModel new];
    resultModel.houseTotalPrice          = houseTotalPrice;
    resultModel.loanTotalPrice           = loanTotalPrice;
    resultModel.repayTotalPrice          = repayTotalPrice;
    resultModel.interestPayment          = interestPayment;
    resultModel.mortgageYear             = calcModel.mortgageYear;
    resultModel.mortgageMonth            = loanMonthCount;
    resultModel.avgMonthRepayment        = avgMonthPrincipalRepayment;
    resultModel.firstMonthRepayment      = firstMonthRepayment;
    resultModel.monthRepaymentArr        = monthRepaymentArr;
    return resultModel;
}

/** =================================== 组合型贷款 =================================== */
#pragma mark - 组合型贷款
#pragma mark 按组合型贷款等额本息总价计算(总价)
+ (MortgageResultModel *)calculateCombinedLoanAsTotalPriceAndEqualPrincipalInterestWithCalcModel:(MortgageModel *)calcModel {
    NSLog(@"按组合型贷款等额本息总价计算(总价)");
    // 商业贷款
    double businessTotalPrice = calcModel.businessTotalPrice;
    // 公积金贷款
    double fundTotalPrice = calcModel.fundTotalPrice;
    // 贷款月数
    int loanMonthCount = calcModel.mortgageYear * 12;
    // 银行月利率
    double bankMonthRate = calcModel.bankRate / 100.0 / 12.0;
    // 公积金月利率
    double fundMonthRate = calcModel.fundRate / 100.0 / 12.0;
    // 贷款总额
    double loanTotalPrice = businessTotalPrice + fundTotalPrice;
    // 每月还款
    double avgMonthRepayment =
    businessTotalPrice*bankMonthRate*powf(1+bankMonthRate, loanMonthCount)/(powf(1+bankMonthRate, loanMonthCount)-1)
    +
    fundTotalPrice*fundMonthRate*powf(1+fundMonthRate, loanMonthCount)/(powf(1+fundMonthRate, loanMonthCount)-1);
    // 还款总额
    double repayTotalPrice = avgMonthRepayment * loanMonthCount;
    // 支付利息
    double interestPayment = repayTotalPrice-loanTotalPrice;
    
    // 每月还款数组
    NSMutableArray *monthRepaymentArr = [[NSMutableArray alloc] init];
    for (int i = 0; i<loanMonthCount; i++) {
        [monthRepaymentArr addObject:[NSString stringWithFormat:@"%f", avgMonthRepayment]];
    }
    
    MortgageResultModel *resultModel = [MortgageResultModel new];
    resultModel.loanTotalPrice           = loanTotalPrice;
    resultModel.repayTotalPrice          = repayTotalPrice;
    resultModel.interestPayment          = interestPayment;
    resultModel.mortgageYear             = calcModel.mortgageYear;
    resultModel.mortgageMonth            = loanMonthCount;
    resultModel.avgMonthRepayment        = avgMonthRepayment;
    resultModel.firstMonthRepayment      = [[monthRepaymentArr firstObject] doubleValue];;
    resultModel.monthRepaymentArr        = monthRepaymentArr;
    return resultModel;
}
#pragma mark 按组合型贷款等额本金总价计算(总价)
+ (MortgageResultModel *)calculateCombinedLoanAsTotalPriceAndEqualPrincipalWithCalcModel:(MortgageModel *)calcModel {
    NSLog(@"按组合型贷款等额本金总价计算(总价)");
    // 每月还款数组
    NSMutableArray *monthRepaymentArr = [[NSMutableArray alloc] init];
    // 商业贷款
    double businessTotalPrice = calcModel.businessTotalPrice;
    // 公积金贷款
    double fundTotalPrice = calcModel.fundTotalPrice;
    // 贷款月数
    int loanMonthCount = calcModel.mortgageYear * 12;
    // 银行月利率
    double bankMonthRate = calcModel.bankRate / 100.0 / 12.0;
    // 公积金月利率
    double fundMonthRate = calcModel.fundRate / 100.0 / 12.0;
    // 贷款总额
    double loanTotalPrice = businessTotalPrice + fundTotalPrice;
    // 商业每月所还本金（每月还款）
    double businessAvgMonthPrincipalRepayment = businessTotalPrice / loanMonthCount;
    // 公积金每月所还本金（每月还款）
    double fundAvgMonthPrincipalRepayment = fundTotalPrice / loanMonthCount;
    // 还款总额
    double repayTotalPrice = 0;
    for (int i = 0; i<loanMonthCount; i++) {
        // 每月还款
        // 公式：每月还款 + (贷款总额-每月还款*i) * 月利率
        double monthRepayment = businessAvgMonthPrincipalRepayment
        +(businessTotalPrice - businessAvgMonthPrincipalRepayment * i)
        *bankMonthRate
        +
        fundAvgMonthPrincipalRepayment
        +(fundTotalPrice - fundAvgMonthPrincipalRepayment * i)
        *fundMonthRate;
        [monthRepaymentArr addObject:[NSString stringWithFormat:@"%f", monthRepayment]];
        repayTotalPrice +=monthRepayment;
    }
    // 支付利息
    double interestPayment = repayTotalPrice-loanTotalPrice;
    
    MortgageResultModel *resultModel = [MortgageResultModel new];
    resultModel.loanTotalPrice           = loanTotalPrice;
    resultModel.repayTotalPrice          = repayTotalPrice;
    resultModel.interestPayment          = interestPayment;
    resultModel.mortgageYear             = calcModel.mortgageYear;
    resultModel.mortgageMonth            = loanMonthCount;
    resultModel.avgMonthRepayment        = businessAvgMonthPrincipalRepayment + fundAvgMonthPrincipalRepayment;
    resultModel.firstMonthRepayment      = [[monthRepaymentArr firstObject] doubleValue];;
    resultModel.monthRepaymentArr        = monthRepaymentArr;
    return resultModel;
}

@end

@implementation MortgageModel

@end


@implementation MortgageResultModel

- (NSString *)description {
    return [NSString stringWithFormat:@"贷款总额: %.2f \n 还款总额: %.2f \n 支付利息: %.2f \n 按揭年数: %.2f \n 月均还款: %.2f \n 首月还款: %.2f \n ", self.loanTotalPrice, self.repayTotalPrice, self.interestPayment, self.mortgageYear, self.avgMonthRepayment, self.firstMonthRepayment];
}

@end














