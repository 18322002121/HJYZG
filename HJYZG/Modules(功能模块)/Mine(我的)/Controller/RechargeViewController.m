//
//  RechargeViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "RechargeViewController.h"
#import "RechargeViewCell.h"

@interface RechargeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

static NSString *const rechargeViewCell = @"RechargeViewCell";

@implementation RechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值";
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
    [_tableView registerClass:[RechargeViewCell class] forCellReuseIdentifier:rechargeViewCell];
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RechargeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rechargeViewCell];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    subView.backgroundColor=kRandomColor;
    return subView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 110;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    subView.backgroundColor=[UIColor whiteColor];
    
    PublicButton *applicationPresentationButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"申请提现" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.15 green:0.71 blue:0.55 alpha:1.00] addView:subView target:self action:@selector(applicationPresentationClick)];
    applicationPresentationButton.layer.cornerRadius =10;
    
    PublicButton *cancelButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"取消" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:subView target:self action:@selector(cancelClick)];
    cancelButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cancelButton.layer.borderWidth = 0.5;
    cancelButton.layer.cornerRadius =10;
    
    [applicationPresentationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(subView.mas_left).offset(20);
        make.right.mas_equalTo(subView.mas_right).offset(-20);
        make.top.mas_equalTo(subView.mas_top).offset(10);
        make.height.mas_offset(@40);
    }];
    
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(subView.mas_left).offset(20);
        make.right.mas_equalTo(subView.mas_right).offset(-20);
        make.top.mas_equalTo(applicationPresentationButton.mas_bottom).offset(10);
        make.height.mas_offset(@40);
    }];

    return subView;
}

#pragma mark - 申请提现
- (void)applicationPresentationClick{
    
}

#pragma mark - 取消
- (void)cancelClick{
    
}



@end
