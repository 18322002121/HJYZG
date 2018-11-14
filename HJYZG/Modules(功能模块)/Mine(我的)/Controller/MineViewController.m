//
//  MineViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/7.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MineViewController.h"
#import "PersonalTableViewCell.h"
#import "RegistrationAndLandingViewController.h"
#import "BaseNavigationController.h"
#import "ViewAllOrdersViewController.h"
#import "PersonalDataViewController.h"
#import "ReceivingAddressViewController.h"
#import "SecuritySettingViewController.h"
#import "MyWalletViewController.h"
#import "MyStagingViewController.h"
#import "VoucherViewController.h"
#import "PropertyFeeViewController.h"
#import "CustomerServiceCenterViewController.h"
#import "MortgageCalculationViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"我的";
    self.view.backgroundColor= [UIColor colorWithRed:0.92 green:0.91 blue:0.92 alpha:1.00];
    if (!isLogins) {
        [self createTable];
    }else{
        RegistrationAndLandingViewController *registrationAndLanding=[[RegistrationAndLandingViewController alloc]init];
        [self presentViewController:[[BaseNavigationController alloc]initWithRootViewController:registrationAndLanding] animated:YES completion:nil];
    }
    
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
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"PersonalTableViewCell";//定义一个cell的标识
    PersonalTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];//从缓存池中取出cell

    if (cell==nil) //如果缓存池中没有cell

    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    _tableView.rowHeight = cell.frame.size.height;
    [self addReloadCustemCell:cell];
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
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    subView.backgroundColor=[UIColor colorWithRed:0.89 green:0.89 blue:0.91 alpha:1.00];
    return subView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];//当点击cell时有灰色，松开没灰色
}

- (void)addReloadCustemCell:(PersonalTableViewCell *)cell{
    //查看全部订单
    cell.viewAllOrdersButton = ^(UIButton *sender) {
        ViewAllOrdersViewController *viewAllOrdersView=[[ViewAllOrdersViewController alloc]init];
        [self.navigationController pushViewController:viewAllOrdersView animated:YES];
    };

    //待付款
    cell.pendingPaymentButton = ^(UIButton *sender) {
        ViewAllOrdersViewController *viewAllOrdersView=[[ViewAllOrdersViewController alloc]init];
        [self.navigationController pushViewController:viewAllOrdersView animated:YES];
    };

    //待发货
    cell.pendingDeliveryButton = ^(UIButton *sender) {
        ViewAllOrdersViewController *viewAllOrdersView=[[ViewAllOrdersViewController alloc]init];
        [self.navigationController pushViewController:viewAllOrdersView animated:YES];
    };

    //待收货
    cell.goodsToBeReceivedButton = ^(UIButton *sender) {
        ViewAllOrdersViewController *viewAllOrdersView=[[ViewAllOrdersViewController alloc]init];
        [self.navigationController pushViewController:viewAllOrdersView animated:YES];
    };

    //待评价
    cell.toBeEvaluatedButton = ^(UIButton *sender) {
        ViewAllOrdersViewController *viewAllOrdersView=[[ViewAllOrdersViewController alloc]init];
        [self.navigationController pushViewController:viewAllOrdersView animated:YES];
    };

    //认购单
    cell.subscriptionFormButton = ^(UIButton *sender) {
        ViewAllOrdersViewController *viewAllOrdersView=[[ViewAllOrdersViewController alloc]init];
        [self.navigationController pushViewController:viewAllOrdersView animated:YES];
    };

    //个人资料
    cell.PersonalDataButton = ^(UIButton *sender) {
        PersonalDataViewController *personalDataView=[[PersonalDataViewController alloc]init];
        [self.navigationController pushViewController:personalDataView animated:YES];
    };

    //收货地址
    cell.ReceivingAddressButton = ^(UIButton *sender) {
        ReceivingAddressViewController *receivingAddressView=[[ReceivingAddressViewController alloc]init];
        [self.navigationController pushViewController:receivingAddressView animated:YES];
    };

    //安全设置
    cell.SecuritySettingButton = ^(UIButton *sender) {
        SecuritySettingViewController *securitySettingView=[[SecuritySettingViewController alloc]init];
        [self.navigationController pushViewController:securitySettingView animated:YES];
    };

    //我的钱包
    cell.MyWalletButton = ^(UIButton *sender) {
        MyWalletViewController *myWalletView=[[MyWalletViewController alloc]init];
        [self.navigationController pushViewController:myWalletView animated:YES];
    };

    //我的分期
    cell.MyStagingButton = ^(UIButton *sender) {
        MyStagingViewController *myStagingView=[[MyStagingViewController alloc]init];
        [self.navigationController pushViewController:myStagingView animated:YES];
    };

    //卡券包
    cell.VoucherButton = ^(UIButton *sender) {
        VoucherViewController *voucherView=[[VoucherViewController alloc]init];
        [self.navigationController pushViewController:voucherView animated:YES];
    };

    //绑物业费
    cell.PropertyFeeButton = ^(UIButton *sender) {
        PropertyFeeViewController *propertyFeeView=[[PropertyFeeViewController alloc]init];
        [self.navigationController pushViewController:propertyFeeView animated:YES];
    };

    //客服中心
    cell.CustomerServiceCenterButton = ^(UIButton *sender) {
        CustomerServiceCenterViewController *customerServiceCenterView=[[CustomerServiceCenterViewController alloc]init];
        UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:customerServiceCenterView];
        //设置NavigationController的模态模式，即NavigationController的显示方式
        navigation.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.modalPresentationStyle = UIModalPresentationCurrentContext;
        [self presentViewController:navigation animated:YES completion:nil];
    };

    // 安全退出
    cell.SafeExitButton = ^(UIButton *sender) {
        NSLog(@"退出");
        RegistrationAndLandingViewController *registrationAndLanding=[[RegistrationAndLandingViewController alloc]init];
        [self presentViewController:[[UINavigationController alloc]initWithRootViewController:registrationAndLanding] animated:YES completion:nil];
    };
    
    //房贷计算器
    cell.mortgageCalculator = ^(UIButton *sender) {
        MortgageCalculationViewController *mortgageCalculation = [[MortgageCalculationViewController alloc]init];
        [self.navigationController pushViewController:mortgageCalculation animated:YES];
    };

}



@end
