//
//  SubscriptionFormViewController.m
//  HJYZG
//
//  Created by HCY on 2018/9/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SubscriptionFormViewController.h"
#import "SubscriptionFormCell.h"

@interface SubscriptionFormViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation SubscriptionFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"认购单";
    self.view.backgroundColor=kRandomColor;
    [self createTable];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"SubscriptionFormCell";
    SubscriptionFormCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil)
        
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    _tableView.rowHeight = cell.frame.size.height;

    return cell;
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    SubscriptionFormViewController *subscriptionForm=[[SubscriptionFormViewController alloc]init];
//    [self.navigationController pushViewController:subscriptionForm animated:YES];
}

@end
