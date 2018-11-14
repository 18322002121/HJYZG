//
//  PersonalDataViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "PersonalDataViewController.h"
#import "PersonalDataCell.h"
#import "ReceivingAddressViewController.h"

@interface PersonalDataViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *titlesArray;
@property(nonatomic,strong)NSArray *titleInformationArray;
@end

@implementation PersonalDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"个人资料";
    self.view.backgroundColor=kRandomColor;
    [self createTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)titlesArray{
    if (!_titlesArray) {
        _titlesArray=[NSArray arrayWithObjects:@"昵称",@"性别",@"账号管理",@"我的手机号",@"个性签名",@"我的二维码",@"我的实名认证",@"我的收货地址",@"感兴趣类别", nil];
    }
    return _titlesArray;
}

-(NSArray *)titleInformationArray{
    if (!_titleInformationArray) {
        _titleInformationArray=[NSArray arrayWithObjects:@"手机用户2121",@"未设置",@"其他登陆方式",@"18322002121",@"未设置",@"",@"未认证",@"新增/修改地址",@"感兴趣类别", nil];
    }
    return _titleInformationArray;
}

-(void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    _tableView.backgroundColor=KWhiteColor;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titlesArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"PersonalDataCell";//定义一个cell的标识
    PersonalDataCell *cell=[tableView dequeueReusableCellWithIdentifier:str];//从缓存池中取出cell
    
    if (cell==nil) //如果缓存池中没有cell
        
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    _tableView.rowHeight = cell.frame.size.height;
    cell.title.text=self.titlesArray[indexPath.row];
    cell.titleInformation.text=self.titleInformationArray[indexPath.row];
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
    if (indexPath.row==7) {
        ReceivingAddressViewController *receivingAddress=[[ReceivingAddressViewController alloc]init];
        [self.navigationController pushViewController:receivingAddress animated:YES];
    }
    
}

@end
