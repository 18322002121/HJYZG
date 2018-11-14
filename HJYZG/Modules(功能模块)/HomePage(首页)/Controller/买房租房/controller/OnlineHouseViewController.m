//
//  OnlineHouseViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "OnlineHouseViewController.h"
#import "OnlineHouseViewCell.h"
#import "BuildingInformationViewController.h"

@interface OnlineHouseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

static NSString *const onlineHouseViewCell = @"OnlineHouseViewCell";
@implementation OnlineHouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我要购房";
    self.view.backgroundColor = kRandomColor;
    [self createTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_tableView registerClass:[OnlineHouseViewCell class] forCellReuseIdentifier:onlineHouseViewCell];
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OnlineHouseViewCell *cell = [tableView dequeueReusableCellWithIdentifier:onlineHouseViewCell];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 240;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, kTopHeight, KScreenWidth, 240)];
    headerView.backgroundColor=kRandomColor;
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.image = [UIImage imageNamed:@"loupan"];
    [headerView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headerView.mas_top).offset(0);
        make.left.mas_equalTo(headerView.mas_left).offset(0);
        make.bottom.mas_equalTo(headerView.mas_bottom).offset(0);
        make.right.mas_equalTo(headerView.mas_right).offset(0);
    }];
    return headerView;
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
    BuildingInformationViewController *buildingInformation = [[BuildingInformationViewController alloc]init];
    [self.navigationController pushViewController:buildingInformation animated:YES];
}

@end
