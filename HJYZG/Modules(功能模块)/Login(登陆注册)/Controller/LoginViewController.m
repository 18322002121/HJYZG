//
//  LoginViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/10.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginCell.h"
#import "ForgetPasswordViewController.h"


@interface LoginViewController ()<ZJScrollPageViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray<NSString *> *titles;
@property(nonatomic,strong)ZJScrollPageView *scrollPageView;
@property(strong, nonatomic)NSArray<UIViewController *> *childVcs;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"登陆";
    [self createTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    _tableView.backgroundColor=KWhiteColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"LoginCell";//定义一个cell的标识
    LoginCell *cell=[tableView dequeueReusableCellWithIdentifier:str];//从缓存池中取出cell
    
    if (cell==nil) //如果缓存池中没有cell
        
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    _tableView.rowHeight = cell.frame.size.height;
    
    [self loginAndRegister:cell];
    
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


- (void)loginAndRegister:(LoginCell *)cell{
    __weak typeof(cell) weakCell = cell;
    // 注册
//    cell.resgisterButton = ^(UIButton *sender) {
//        RegisterViewController *registerView=[[RegisterViewController alloc]init];
//        [self.navigationController pushViewController:registerView animated:YES];
//    };
//     忘记密码
    cell.forgetPasswordButton = ^(UIButton *sender) {
        ForgetPasswordViewController *forgetPassword=[[ForgetPasswordViewController alloc]init];
        [self.navigationController pushViewController:forgetPassword animated:YES];
    };
    // 登陆
    cell.loginButton = ^(UIButton *sender) {
        [HCYRequestManager appLoginUsername:weakCell.username.text password:weakCell.password.text success:^(id responseObject) {
            NSLog(@"%@",responseObject);
            if ([responseObject[@"code"] integerValue] == 200) {
                if ([responseObject[@"data"][@"status"]integerValue] == 1) {
                    [YJProgressHUD showMsgWithoutView:responseObject[@"msg"]];
                }else{
                    [YJProgressHUD showMsgWithoutView:responseObject[@"msg"]];
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }
        } failure:^(NSError *errorMessage) {
            [YJProgressHUD showMsgWithoutView:@"服务器内部错误"];
        }];
    };
}

#pragma mark - 创建头部滚动条
- (void)reloadScrollviewSegment{
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    style.showLine = YES;//显示滚动条
    style.gradualChangeTitleColor = YES;// 颜色渐变
    style.autoAdjustTitlesWidth=YES;
    style.adjustCoverOrLineWidth=YES;
    self.titles = @[@"综合",
                    @"销量",
                    @"价格",
                    @"新品",
                    ];
    _scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, KScreenWidth, KScreenHeight - 64.0) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    [self.view addSubview:_scrollPageView];
    
}
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    
    if (!childVc) {
//        childVc = [[CommercialStorefrontViewController alloc] init];
    }
    return childVc;
}


- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}



@end
