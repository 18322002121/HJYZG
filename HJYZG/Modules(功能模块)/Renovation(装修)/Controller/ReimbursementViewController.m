//
//  ReimbursementViewController.m
//  HJYZG
//
//  Created by HCY on 2018/9/10.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ReimbursementViewController.h"
#import "ReimbursementViewCell.h"
#import "ReimbursementHeaderView.h"
#import "ReimbursementFixedHeaderView.h"

@interface ReimbursementViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ReimbursementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"还款明细";
    [self createTable];
    
    ReimbursementFixedHeaderView *aaView = [[[NSBundle mainBundle] loadNibNamed:@"ReimbursementFixedHeaderView" owner:self options:nil] lastObject];
    aaView.frame=CGRectMake(0, kTopHeight, KScreenWidth, 120);
    aaView.totalLoan.text = [NSString stringWithFormat:@"%.2f万元",self.totalLoan/10000];
    aaView.paymentInterest.text = [NSString stringWithFormat:@"%.2f万元",self.totalInterest/10000];
    aaView.totalRepayment.text = [NSString stringWithFormat:@"%.2f万元",self.totalLoan/10000 + self.totalInterest/10000];
    
    [self.view addSubview:aaView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight+120, KScreenWidth, KScreenHeight-kTopHeight-120) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"ReimbursementHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"ReimbursementHeaderView"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.monthlyInterestRate.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"ReimbursementViewCell";
    ReimbursementViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil)
        
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    _tableView.rowHeight = cell.frame.size.height;
    [self reloadReimbursementViewCell:cell cellForRowAtIndexPath:indexPath];
    return cell;
    
}

- (void)reloadReimbursementViewCell:(ReimbursementViewCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.numberPeriods.text = [NSString stringWithFormat:@"(第%ld期)",(long)indexPath.row+1];
    cell.principal.text = [NSString stringWithFormat:@"%@",self.yuehuanbenjinArr[indexPath.row]];
    cell.interest.text = [NSString stringWithFormat:@"%@",self.monthlyInterestRate[indexPath.row]];
    cell.monthlySupply.text = [NSString stringWithFormat:@"%@",self.interestResultArray[indexPath.row]];
    cell.surplus.text = [NSString stringWithFormat:@"%@",self.shengyudaikuanArr[indexPath.row]];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    return subView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    return subView;
}



@end
