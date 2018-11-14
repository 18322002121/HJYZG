//
//  MyWalletViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MyWalletViewController.h"
#import "MyWalletViewCell.h"
#import "MyWalletViewShowCell.h"
#import "RechargeViewController.h"
#import "PutForwardViewController.h"

@interface MyWalletViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

static NSString *const myWalletViewCell = @"MyWalletViewCell";
static NSString *const myWalletViewShowCell = @"MyWalletViewShowCell";
@implementation MyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的钱包";
    self.view.backgroundColor=kRandomColor;
    [self createTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    _tableView.backgroundColor=KWhiteColor;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_tableView registerClass:[MyWalletViewCell class] forCellReuseIdentifier:myWalletViewCell];
    [_tableView registerClass:[MyWalletViewShowCell class] forCellReuseIdentifier:myWalletViewShowCell];
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *temporaryCell = nil;
    if (indexPath.section == 0) {
        MyWalletViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myWalletViewCell];
        [self reloadMyWalletViewCell:cell];
        temporaryCell = cell;
    }else{
        MyWalletViewShowCell *cell = [tableView dequeueReusableCellWithIdentifier:myWalletViewShowCell];
        cell.backgroundColor = kRandomColor;
        temporaryCell = cell;
    }
    return temporaryCell;
}

- (void)reloadMyWalletViewCell:(MyWalletViewCell *)cell{
    
    //充值
    cell.rechargeClick = ^(UIButton *sender) {
        RechargeViewController *rechargeView = [[RechargeViewController alloc]init];
        [self.navigationController pushViewController:rechargeView animated:YES];
    };
    
    //提现
    cell.putForwardClick = ^(UIButton *sender) {
        PutForwardViewController *putForwardView = [[PutForwardViewController alloc]init];
        [self.navigationController pushViewController:putForwardView animated:YES];
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
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    return subView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];//当点击cell时有灰色，松开没灰色
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        return 350;
    }else{
        return 90;
    }
}

@end
