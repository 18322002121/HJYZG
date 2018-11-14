//
//  MortgageCalculationViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/10.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MortgageCalculationViewController.h"
#import "MortgageCalculationCell.h"
#import "MortgageCalculationTwoCell.h"
#import "MortgageCalculationModels.h"
#import "ReimbursementViewController.h"
#import "MortgageCalculationResultCell.h"
#import "HousingLoanResultsModel.h"

@interface MortgageCalculationViewController ()<JXCategoryViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic,assign) NSInteger totalNumber;
@property (nonatomic,strong) JHRingChart *ringChart;
@property (nonatomic,assign) BOOL isClicks;
@property (nonatomic,assign) NSInteger loanAmountPrice;
@property (nonatomic,strong) NSMutableArray *loanResultsArray;
@property (nonatomic,strong)MortgageResultModel *interestResult;//等额本息
@property (nonatomic,strong)MortgageResultModel *capitalResult;//等额本金
@end
static NSString *const mortgageCalculationCell = @"MortgageCalculationCell";
static NSString *const mortgageCalculationTwoCell = @"MortgageCalculationTwoCell";
static NSString *const mortgageCalculationResultCell = @"MortgageCalculationResultCell";
@implementation MortgageCalculationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title=@"房贷计算器";
    [self createTable];
    [self navigationBottom];
}

- (void)navigationBottom{
    UIView *navigationBottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kTopHeight, KScreenWidth, 40)];
    navigationBottomView.backgroundColor = KWhiteColor;
    JXCategoryTitleView *titlesView = [[JXCategoryTitleView alloc]initWithFrame:CGRectMake(0, 0, navigationBottomView.frame.size.width, 40)];
    titlesView.titleFont = [UIFont systemFontOfSize:13.0];
    titlesView.delegate = self;
    titlesView.titles = @[@"商业贷",@"公积金贷"];
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorLineViewColor = [UIColor redColor];
    lineView.indicatorLineWidth = JXCategoryViewAutomaticDimension;
    lineView.indicatorLineViewHeight = 2;
    titlesView.indicators = @[lineView];
    [navigationBottomView addSubview:titlesView];
    [self.view addSubview:navigationBottomView];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight+40, KScreenWidth, KScreenHeight-kTopHeight-40) style:UITableViewStyleGrouped];
    _tableView.backgroundColor=KWhiteColor;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_tableView registerClass:[MortgageCalculationCell class] forCellReuseIdentifier:mortgageCalculationCell];
    [_tableView registerClass:[MortgageCalculationTwoCell class] forCellReuseIdentifier:mortgageCalculationTwoCell];
    [_tableView registerClass:[MortgageCalculationResultCell class] forCellReuseIdentifier:mortgageCalculationResultCell];
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (self.isShows == YES) {
        return 2;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 4;
    }else{
        return 7;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *temporaryCell;
    if (indexPath.section ==0) {
        if (indexPath.row ==0) {
            MortgageCalculationTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:mortgageCalculationTwoCell];
            __weak typeof(cell) weakCell = cell;
            if (indexPath.row == 0) {
                cell.leftTwoTitle.text = @"贷款总额:";
                cell.centerTextfield.placeholder = @"请输入贷款总额";
                self.businessTotalPrice = [cell.centerTextfield.text doubleValue];
                cell.reloadTextfield = ^(UITextField *textField) {
                    if (textField.text) {
                        self.businessTotalPrice = [weakCell.centerTextfield.text doubleValue];
                    }
                    if (!self.businessTotalPrice) {
                        weakCell.centerTextfield.text = [NSString stringWithFormat:@"%f",self.businessTotalPrice];
                    }
                };
            }
            temporaryCell = cell;
        }else{
            MortgageCalculationCell *cell = [tableView dequeueReusableCellWithIdentifier:mortgageCalculationCell];
            if (indexPath.row == 1) {
                cell.leftTitle.text = @"按揭年数:";
                [cell.rightButton setTitle:@"请选择期数" forState:UIControlStateNormal];
            }else if (indexPath.row ==2){
                cell.leftTitle.text = @"首次还款时间(年月):";
                [cell.rightButton setTitle:@"请选择时间" forState:UIControlStateNormal];
            }else if (indexPath.row == 3){
                cell.leftTitle.text = @"利       率:";
                [cell.rightButton setTitle:@"请选择利率" forState:UIControlStateNormal];
            }
            [self reloadMortgageCalculationCell:cell cellForRowAtIndexPath:indexPath];
            temporaryCell = cell;
        }
    }else{
        MortgageCalculationResultCell *cell = [tableView dequeueReusableCellWithIdentifier:mortgageCalculationResultCell];
        [self reloadMortgageCalculationResultCell:cell cellForRowAtIndexPath:indexPath];
        temporaryCell = cell;
    }
  return temporaryCell;
}

#pragma mark - 开始计算
- (void)startCalculationClick{
    if (!self.businessTotalPrice) {
        [YJProgressHUD showMsgWithoutView:@"请输入贷款金额"];
    }else{
        self.isShows = YES;
        [self.tableView reloadData];
        MortgageModel *calcModel=[[MortgageModel alloc]init];
        calcModel.businessTotalPrice = self.businessTotalPrice;//贷款总额
        calcModel.mortgageYear = self.providentPeriod;//贷款年数
        calcModel.bankRate = self.commercialLoanInterestRate;
#pragma mark - 等额本息
        _interestResult=[MortgageCalculationModels calculateBusinessLoanAsTotalPriceAndEqualPrincipalInterestWithCalcModel:calcModel];
        NSLog(@"%@",_capitalResult.description);
        
#pragma mark - 等额本金
        _capitalResult=[MortgageCalculationModels calculateBusinessLoanAsTotalPriceAndEqualPrincipalWithCalcModel:calcModel];
        NSLog(@"%@",_interestResult.description);
    }
}

- (void)reloadMortgageCalculationResultCell:(MortgageCalculationResultCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        self.ringChart = [[JHRingChart alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 180)];
        self.ringChart.backgroundColor = [UIColor whiteColor];
        self.ringChart.valueDataArr = @[@"10",@"6",@"6"];
        self.ringChart.fillColorArray = @[[UIColor colorWithRed:1.00 green:0.77 blue:0.24 alpha:1.00],[UIColor colorWithRed:0.89 green:0.45 blue:0.33 alpha:1.00],[UIColor colorWithRed:0.24 green:0.57 blue:1.00 alpha:1.00]];
        [self.ringChart showAnimation];
        [cell addSubview:self.ringChart];
        
    }else{
        
        NSArray *dataArray = @[@{@"leftTitle":@"",@"centerTitle":@"",@"rightTitle":@""},
                               @{@"leftTitle":@"贷款类型",@"centerTitle":@"等额本息",@"rightTitle":@"等额本金"},
                               @{@"leftTitle":@"贷款总额",@"centerTitle":[NSString stringWithFormat:@"%.2f万元",self.businessTotalPrice],@"rightTitle":[NSString stringWithFormat:@"%.2f万元",self.businessTotalPrice]},
                               @{@"leftTitle":@"支付利息",@"centerTitle":[NSString stringWithFormat:@"%.2f万元",_interestResult.interestPayment/10000],@"rightTitle":[NSString stringWithFormat:@"%.2f万元",_capitalResult.interestPayment/10000]},
                               @{@"leftTitle":@"利率",@"centerTitle":[NSString stringWithFormat:@"%.2f%%",_commercialLoanInterestRate],@"rightTitle":[NSString stringWithFormat:@"%.2f%%",_commercialLoanInterestRate]},
                               @{@"leftTitle":@"首月月供",@"centerTitle":[NSString stringWithFormat:@"%.2f元",_interestResult.avgMonthRepayment],@"rightTitle":[NSString stringWithFormat:@"%.2f元",_capitalResult.avgMonthRepayment]},
                               @{@"leftTitle":@"每月递减",@"centerTitle":@"0元",@"rightTitle":[NSString stringWithFormat:@"%.2f元",_capitalResult.monthlyDecline]},
                               ];
        self.loanResultsArray = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dict in dataArray) {
            [self.loanResultsArray addObject:[HousingLoanResultsModel initWithDictionary:dict]];
        }
        cell.loanResultsModel = self.loanResultsArray[indexPath.row];
    }
}

- (void)reloadMortgageCalculationCell:(MortgageCalculationCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    cell.rightClickBlock = ^(UIButton *sender) {
        if (indexPath.row == 1) {
            NSArray *dataSource = @[@"30年(360期)", @"29年(348期)", @"28年(336期)", @"27年(324期)", @"26年(312期)", @"25年(300期)", @"24年(288期)", @"23年(276期)", @"22年(264期)", @"21年(252期)", @"20年(240期)", @"19年(228期)", @"18年(216期)", @"17年(204期)", @"16年(192期)", @"15年(180期)", @"14年(168期)", @"13年(156期)", @"12年(144期)", @"11年(132期)", @"10年(120期)", @"9年(108期)", @"8年(96期)", @"7年(84期)", @"6年(72期)", @"5年(60期)", @"4年(48期)", @"3年(36期)", @"2年(24期)",@"1年(12期)",];
            [BRStringPickerView showStringPickerWithTitle:@"按揭年数" dataSource:dataSource defaultSelValue:nil isAutoSelect:YES themeColor:nil resultBlock:^(id selectValue) {
                [sender setTitle:selectValue forState:UIControlStateNormal];
    
                if ([[[sender.currentTitle substringToIndex:2] substringToIndex:1] isEqualToString:@"年"]) {
                   self.providentPeriod = [[sender.currentTitle stringByReplacingOccurrencesOfString:@"年" withString:@""]doubleValue];
                }else{
                    self.providentPeriod = [[sender.currentTitle substringToIndex:2]doubleValue];
                }
                
                NSLog(@"%f",self.providentPeriod);
                
            } cancelBlock:^{
                NSLog(@"点击了背景视图或取消按钮");
            }];
            
        }else if(indexPath.row == 2){
            [BRDatePickerView showDatePickerWithTitle:@"选择时间" dateType:(BRDatePickerModeDate) defaultSelValue:nil resultBlock:^(NSString *selectValue) {
                [sender setTitle:selectValue forState:UIControlStateNormal];
            }];
        }else if(indexPath.row == 3){
            NSArray *dataSource = @[@"最新基准利率(4.90%)", @"9折", @"9.5折", @"1.05倍", @"1.1倍", @"1.2倍"];
            [BRStringPickerView showStringPickerWithTitle:@"利率" dataSource:dataSource defaultSelValue:nil isAutoSelect:YES themeColor:nil resultBlock:^(id selectValue) {
                [sender setTitle:selectValue forState:UIControlStateNormal];
                if ([selectValue isEqualToString:@"最新基准利率(4.90%)"]) {
                    self.commercialLoanInterestRate = 4.90;
                }else if ([selectValue isEqualToString:@"1.1倍"]){
                    self.commercialLoanInterestRate = 4.90*1.1;
                }else if ([selectValue isEqualToString:@"1.2倍"]){
                    self.commercialLoanInterestRate = 4.90*1.2;
                }else if ([selectValue isEqualToString:@"1.3倍"]){
                    self.commercialLoanInterestRate = 4.90*1.3;
                }
            } cancelBlock:^{
                NSLog(@"点击了背景视图或取消按钮");
            }];
        }
        
    };
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    return subView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 120)];
    if (section == 0) {
        PublicButton *startCalculation = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"开始计算" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.15 green:0.57 blue:0.19 alpha:1.00] addView:subView target:self action:@selector(startCalculationClick)];
        startCalculation.layer.cornerRadius = 5;
        [startCalculation mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(subView.mas_centerY).offset(0);
            make.centerX.mas_equalTo(subView.mas_centerX).offset(0);
            make.left.mas_equalTo(subView.mas_left).offset(20);
            make.right.mas_equalTo(subView.mas_right).offset(-20);
            make.height.mas_offset(@40);
        }];
    }else{
        PublicButton *detailsButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"箭头_右" backgroundImageImage:@"" title:@"查看还款详情" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:subView target:self action:@selector(detailsButtonClick)];
        [detailsButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(subView.mas_centerY).offset(0);
            make.centerX.mas_equalTo(subView.mas_centerX).offset(0);
            make.left.mas_equalTo(subView.mas_left).offset(20);
            make.right.mas_equalTo(subView.mas_right).offset(-20);
            make.height.mas_offset(@40);
        }];
    }
    
    return subView;
}

#pragma mark - 查看还款详情
- (void)detailsButtonClick{
    NSLog(@"还款详情");
    ReimbursementViewController *reimbursement = [[ReimbursementViewController alloc]init];
    //等额本息
    reimbursement.totalLoan = _interestResult.loanTotalPrice;
    reimbursement.totalInterest = _interestResult.interestPayment;
    reimbursement.capitalResultArray = _capitalResult.monthRepaymentArr;
    reimbursement.interestResultArray = _interestResult.monthRepaymentArr;
    reimbursement.monthlyInterestRate = _interestResult.monthlyInterestRate;
    reimbursement.yuehuanbenjinArr = _interestResult.yuehuanbenjinArr;
    reimbursement.shengyudaikuanArr = _interestResult.shengyudaikuanArr;
    //等额本金
    [self.navigationController pushViewController:reimbursement animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==1) {
        if (indexPath.row ==0) {
            return 200;
        }else{
            return 30;
        }
    }else{
        return 44;
    }
}




//
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
////    if (!self.isClicks) {
////        return self.view.frame.size.height;
////    }else{
//        return _tableView.rowHeight;
////    }
//}
//
//


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];//当点击cell时有灰色，松开没灰色
//}
//
//- (void)mortgageCalculator:(MortgageCalculationCell *)cell{
//
//    __weak typeof(cell) weakCell = cell;
//    self.totalNumber = [cell.totalHousePriceTextfield.text integerValue];
//
//    //首付比例选择
//    cell.downPaymentRatioSelectButton = ^(UIButton *sender) {
//
//        self.totalHousePrice=weakCell.totalHousePriceTextfield.text;
//        // 自定义单列字符串
//        NSArray *dataSource = @[@"20%", @"25%", @"30%", @"35%", @"40%", @"45%", @"50%", @"55%", @"60%", @"65%", @"70%", @"75%", @"80%"];
//        [BRStringPickerView showStringPickerWithTitle:@"计算方式" dataSource:dataSource defaultSelValue:nil isAutoSelect:YES themeColor:nil resultBlock:^(id selectValue) {
//
//            double totalPrice =[weakCell.totalHousePriceTextfield.text doubleValue] * ([[selectValue substringToIndex:2] doubleValue]/100);
//            self.downPayments=totalPrice;
//            self.loanAmountPrice = [weakCell.totalHousePriceTextfield.text doubleValue]-self.downPayments;
//            [sender setTitle:[NSString stringWithFormat:@"%@(%.2f万)",selectValue,self.downPayments] forState:UIControlStateNormal];
//        } cancelBlock:^{
//            NSLog(@"点击了背景视图或取消按钮");
//        }];
//    };
//
//    //商业贷款选择框
//    cell.commercialLoanSelectChangeBegin = ^(UIButton *sender) {
//        NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:0];
//
//        for (int i=1; i<self.loanAmountPrice+1; i++) {
//            NSString * dataStr=[NSString stringWithFormat:@"%d万",i];
//            [dataArray addObject:dataStr];
//        }
//       NSArray *reverseArray=[[dataArray reverseObjectEnumerator]allObjects];
//        if (reverseArray.count>0) {
//            [BRStringPickerView showStringPickerWithTitle:@"商业贷款金额" dataSource:reverseArray defaultSelValue:nil isAutoSelect:YES themeColor:nil resultBlock:^(id selectValue) {
//                [sender setTitle:selectValue forState:UIControlStateNormal];
//                self.commercialLoan=selectValue;
//            } cancelBlock:^{
//                NSLog(@"点击了背景视图或取消按钮");
//            }];
//        }
//
//    };
//
//    //商业贷款年限
//    cell.commercialLoanPeriodSelectButton = ^(UIButton *sender) {
//        // 自定义单列字符串
//        NSArray *dataSource = @[@"30年", @"29年", @"28年", @"27年", @"26年", @"25年", @"24年", @"23年", @"22年", @"21年", @"20年", @"19年", @"18年", @"17年", @"16年", @"15年", @"14年", @"13年", @"12年", @"11年", @"10年", @"9年", @"8年", @"7年", @"6年", @"5年", @"4年", @"3年", @"2年", @"1年"];
//        [BRStringPickerView showStringPickerWithTitle:@"公积金贷款年限" dataSource:dataSource defaultSelValue:nil isAutoSelect:YES themeColor:nil resultBlock:^(id selectValue) {
//            [sender setTitle:selectValue forState:UIControlStateNormal];
//            self.providentPeriod=[selectValue stringByReplacingOccurrencesOfString:@"年" withString:@""];
//        } cancelBlock:^{
//            NSLog(@"点击了背景视图或取消按钮");
//        }];
//    };
//
//    //商业贷款利率
//    cell.commercialLoanInterestRateSelectButton = ^(UIButton *sender) {
//        // 自定义单列字符串
//        NSArray *dataSource = @[@"最新基准利率(4.90%)", @"9折", @"9.5折", @"1.05倍", @"1.1倍", @"1.2倍"];
//        [BRStringPickerView showStringPickerWithTitle:@"商业贷款利率" dataSource:dataSource defaultSelValue:nil isAutoSelect:YES themeColor:nil resultBlock:^(id selectValue) {
//            [sender setTitle:selectValue forState:UIControlStateNormal];
//            if ([selectValue isEqualToString:@"最新基准利率(4.90%)"]) {
//                self.commercialLoanInterestRate=[NSString stringWithFormat:@"%f",4.90];
//            }else if ([selectValue isEqualToString:@"1.1倍"]){
//                self.commercialLoanInterestRate=[NSString stringWithFormat:@"%f",4.90*1.1];
//            }else if ([selectValue isEqualToString:@"1.2倍"]){
//                self.commercialLoanInterestRate=[NSString stringWithFormat:@"%f",4.90*1.2];
//            }else if ([selectValue isEqualToString:@"1.3倍"]){
//                self.commercialLoanInterestRate=[NSString stringWithFormat:@"%f",4.90*1.3];
//            }
////            self.commercialLoanInterestRate=selectValue;
//        } cancelBlock:^{
//            NSLog(@"点击了背景视图或取消按钮");
//        }];
//
//    };
//
//    //公积金贷款选择框
//    cell.housingProvidentLoanSelectChangeBegin = ^(UIButton *sender) {
//        NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:0];
//        for (int i=1; i<self.loanAmountPrice+1; i++) {
//            NSString * dataStr=[NSString stringWithFormat:@"%d万",i];
//            [dataArray addObject:dataStr];
//        }
//        NSArray *reverseArray=[[dataArray reverseObjectEnumerator]allObjects];
//        if (reverseArray.count>0) {
//            [BRStringPickerView showStringPickerWithTitle:@"公积金贷款金额" dataSource:reverseArray defaultSelValue:nil isAutoSelect:YES themeColor:nil resultBlock:^(id selectValue) {
//                [sender setTitle:selectValue forState:UIControlStateNormal];
//                self.housingProvidentLoan=selectValue;
//            } cancelBlock:^{
//                NSLog(@"点击了背景视图或取消按钮");
//            }];
//        }
//
//    };
//
//    //公积金贷款年限
//    cell.housingProvidentLoanPeriodSelectButton = ^(UIButton *sender) {
//        // 自定义单列字符串
//        NSArray *dataSource = @[@"30年", @"29年", @"28年", @"27年", @"26年", @"25年", @"24年", @"23年", @"22年", @"21年", @"20年", @"19年", @"18年", @"17年", @"16年", @"15年", @"14年", @"13年", @"12年", @"11年", @"10年", @"9年", @"8年", @"7年", @"6年", @"5年", @"4年", @"3年", @"2年", @"1年"];
//        [BRStringPickerView showStringPickerWithTitle:@"公积金贷款年限" dataSource:dataSource defaultSelValue:nil isAutoSelect:YES themeColor:nil resultBlock:^(id selectValue) {
//            [sender setTitle:selectValue forState:UIControlStateNormal];
//            self.commercialLoanLife=[selectValue stringByReplacingOccurrencesOfString:@"年" withString:@""];
//        } cancelBlock:^{
//            NSLog(@"点击了背景视图或取消按钮");
//        }];
//    };
//
//    //公积金贷款利率
//    cell.housingProvidentLoanInterestRateSelectButton = ^(UIButton *sender) {
//        // 自定义单列字符串
//        NSArray *dataSource = @[@"最新基准利率(3.25%)", @"1.1倍", @"1.2倍", @"1.3倍",];
//        [BRStringPickerView showStringPickerWithTitle:@"商业贷款利率" dataSource:dataSource defaultSelValue:nil isAutoSelect:YES themeColor:nil resultBlock:^(id selectValue) {
//            [sender setTitle:selectValue forState:UIControlStateNormal];
//            if ([selectValue isEqualToString:@"最新基准利率(3.25%)"]) {
//                self.housingProvidentLoanInterestRate=[NSString stringWithFormat:@"%f",3.25];
//            }else if ([selectValue isEqualToString:@"1.1倍"]){
//                self.housingProvidentLoanInterestRate=[NSString stringWithFormat:@"%f",3.25*1.1];
//            }else if ([selectValue isEqualToString:@"1.2倍"]){
//                self.housingProvidentLoanInterestRate=[NSString stringWithFormat:@"%f",3.25*1.2];
//            }else if ([selectValue isEqualToString:@"1.3倍"]){
//                self.housingProvidentLoanInterestRate=[NSString stringWithFormat:@"%f",3.25*1.3];
//            }
//            self.housingProvidentLoanInterestRate=selectValue;
//        } cancelBlock:^{
//            NSLog(@"点击了背景视图或取消按钮");
//        }];
//    };
//
//    //开始计算按钮
//    cell.immediateCalculationButton = ^(UIButton *sender) {
//        if (self.isClicks==NO) {
//
//            self.isClicks=YES;
//
//        }
//
//        self.tableView.contentOffset=CGPointMake(0, 300);
//        [self equalAmountOfInterest:weakCell];
//    };
//
//    //还款明细
//    cell.reimbursementButton = ^(UIButton *sender) {

//        reimbursement.downPayments=
//        reimbursement.totalLoan=
//        reimbursement.totalInterest=
//        ReimbursementViewController *reimbursement = [[ReimbursementViewController alloc]init];
//        [self.navigationController pushViewController:reimbursement animated:YES];
//    };
//
//    //等额本息
//    cell.equalAmountInterestClickButton = ^(UIButton *sender) {
//
//        [weakCell.equalAmountPrincipalButton setBackgroundColor:[UIColor whiteColor]];
//        [weakCell.equalAmountPrincipalButton setTitleColor:[UIColor colorWithRed:0.16 green:0.61 blue:0.21 alpha:1.00] forState:UIControlStateNormal];
//        weakCell.equalAmountInterestButton.backgroundColor=[UIColor colorWithRed:0.16 green:0.61 blue:0.21 alpha:1.00];
//        [weakCell.equalAmountInterestButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [self equalAmountOfInterest:weakCell];
//    };
//
//    //等额本金
//    cell.equalAmountPrincipalClickButton = ^(UIButton *sender) {
//
//        weakCell.equalAmountInterestButton.backgroundColor=[UIColor whiteColor];
//        [weakCell.equalAmountInterestButton setTitleColor:[UIColor colorWithRed:0.16 green:0.61 blue:0.21 alpha:1.00] forState:UIControlStateNormal];
//        [weakCell.equalAmountPrincipalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        weakCell.equalAmountPrincipalButton.backgroundColor=[UIColor colorWithRed:0.16 green:0.61 blue:0.21 alpha:1.00];
//        [self equalAmountOfPrincipal:weakCell];
//    };
//
//}
//
//
//#pragma mark - 等额本金计算
//
//
//- (void)equalAmountOfPrincipal:(MortgageCalculationCell *)cell{
//    //等额本金
//    self.ringChart = [[JHRingChart alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 300)];
//    self.ringChart.backgroundColor = [UIColor whiteColor];
//    self.ringChart.valueDataArr = @[@"10",@"6",@"6"];
//    //    self.ringChart.ringWidth = 35.0;
//    self.ringChart.fillColorArray = @[[UIColor colorWithRed:1.00 green:0.77 blue:0.24 alpha:1.00],[UIColor colorWithRed:0.89 green:0.45 blue:0.33 alpha:1.00],[UIColor colorWithRed:0.24 green:0.57 blue:1.00 alpha:1.00]];
//    [self.ringChart showAnimation];
//    [cell.animaltionBackView addSubview:self.ringChart];
//
//    MortgageModel *calcModel=[[MortgageModel alloc]init];
//    calcModel.businessTotalPrice = [self.totalHousePrice doubleValue];//贷款总额
//    calcModel.fundTotalPrice = [self.totalHousePrice doubleValue];//公积金贷款总额
//    calcModel.bankRate = [self.commercialLoanInterestRate doubleValue];//银行利率
//    calcModel.fundRate = [self.housingProvidentLoanInterestRate doubleValue];//公积金利率
//    calcModel.mortgageYear = [self.providentPeriod doubleValue];//贷款年数
//    //        calcModel.mortgageMulti = self.mortgageMulti;
//    calcModel.businessTotalPrice=[self.commercialLoan doubleValue];//商业贷款总额
//    MortgageResultModel *capitalResult;
//    capitalResult=[MortgageCalculationModels calculateBusinessLoanAsTotalPriceAndEqualPrincipalWithCalcModel:calcModel];
//    cell.downPaymentsMoney.text=[NSString stringWithFormat:@"%.f万元",self.downPayments];
//    cell.loanMoney.text=[NSString stringWithFormat:@"%ld万元",(long)self.loanAmountPrice];
////    if ([[NSString stringWithFormat:@"%.2f万元",capitalResult.interestPayment/10000] containsString:@"."]) {
////        cell.InterestMoney.text= [NSString stringWithFormat:@"%.f万元",ceilf(capitalResult.interestPayment/10000)];//进位操作
////    }else if ([[NSString stringWithFormat:@"%.2f万元",capitalResult.interestPayment/10000] containsString:@".00"]){
////        cell.InterestMoney.text=[NSString stringWithFormat:@"%.f万元",capitalResult.interestPayment/10000];
////    }
//    cell.InterestMoney.text=[NSString stringWithFormat:@"%.f万元",capitalResult.interestPayment/10000];
//    NSLog(@"%@",capitalResult.monthRepaymentArr);
//    cell.monthlySupplyMoney.text=[NSString stringWithFormat:@"%.2f元/月",capitalResult.avgMonthRepayment];
//}
//
//#pragma mark - 等额本息计算
//
//
//- (void)equalAmountOfInterest:(MortgageCalculationCell *)cell{
//    cell.equalAmountInterestButton.backgroundColor = [UIColor colorWithRed:0.16 green:0.61 blue:0.21 alpha:1.00];
//    [cell.equalAmountInterestButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    self.ringChart = [[JHRingChart alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 300)];
//    self.ringChart.backgroundColor = [UIColor whiteColor];
//    self.ringChart.valueDataArr = @[@"10",@"6",@"6"];
//    //    self.ringChart.ringWidth = 35.0;
//    self.ringChart.fillColorArray = @[[UIColor colorWithRed:1.00 green:0.77 blue:0.24 alpha:1.00],[UIColor colorWithRed:0.89 green:0.45 blue:0.33 alpha:1.00],[UIColor colorWithRed:0.24 green:0.57 blue:1.00 alpha:1.00]];
//    [self.ringChart showAnimation];
//    [cell.animaltionBackView addSubview:self.ringChart];
//
//    MortgageModel *calcModel=[[MortgageModel alloc]init];
//    calcModel.businessTotalPrice = [self.totalHousePrice doubleValue];//贷款总额
//    calcModel.fundTotalPrice = [self.totalHousePrice doubleValue];//公积金贷款总额
//    calcModel.bankRate = [self.commercialLoanInterestRate doubleValue];//银行利率
//    calcModel.fundRate = [self.housingProvidentLoanInterestRate doubleValue];//公积金利率
//    calcModel.mortgageYear = [self.providentPeriod doubleValue];//贷款年数
//    //        calcModel.mortgageMulti = self.mortgageMulti;
//    calcModel.businessTotalPrice=[self.commercialLoan doubleValue];//商业贷款总额
//    MortgageResultModel *principalResult;
//    principalResult = [MortgageCalculationModels calculateBusinessLoanAsTotalPriceAndEqualPrincipalInterestWithCalcModel:calcModel];
//    cell.downPaymentsMoney.text=[NSString stringWithFormat:@"%.f万元",self.downPayments];
//    cell.loanMoney.text=[NSString stringWithFormat:@"%ld万元",(long)self.loanAmountPrice];
////    if ([[NSString stringWithFormat:@"%.2f万元",principalResult.interestPayment/10000] containsString:@"."]) {
////        cell.InterestMoney.text= [NSString stringWithFormat:@"%.f万元",ceilf(principalResult.interestPayment/10000)];//进位操作
////    }else if ([[NSString stringWithFormat:@"%.2f万元",principalResult.interestPayment/10000] containsString:@".00"]){
////        cell.InterestMoney.text=[NSString stringWithFormat:@"%.f万元",principalResult.interestPayment/10000];
////    }
//    cell.InterestMoney.text=[NSString stringWithFormat:@"%.f万元",principalResult.interestPayment/10000];
//    NSLog(@"%@",principalResult.monthRepaymentArr);
//    cell.monthlySupplyMoney.text=[NSString stringWithFormat:@"%.2f元/月",principalResult.avgMonthRepayment];
//}

@end

