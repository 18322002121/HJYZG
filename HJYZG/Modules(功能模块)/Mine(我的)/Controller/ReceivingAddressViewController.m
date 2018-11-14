//
//  ReceivingAddressViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ReceivingAddressViewController.h"
#import "ReceivingAddressCell.h"
#import "NewReceiptAddressViewController.h"
@interface ReceivingAddressViewController ()
/** 判断是否有地址 */
@property(nonatomic,assign)BOOL isAddress;
@end

@implementation ReceivingAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"收货地址";
    self.view.backgroundColor=KWhiteColor;
    [self createTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    _tableView.backgroundColor=KWhiteColor;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    if (_isAddress) {
        [self.view addSubview:_tableView];
    }else{
        [self loadAddAddewssView];
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"ReceivingAddressCell";//定义一个cell的标识
    ReceivingAddressCell *cell=[tableView dequeueReusableCellWithIdentifier:str];//从缓存池中取出cell
    
    if (cell==nil) //如果缓存池中没有cell
        
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    _tableView.rowHeight = cell.frame.size.height;

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
//加载新增地址view
- (void)loadAddAddewssView{
    UIView *addView=[[UIView alloc]init];
    [self.view addSubview:addView];
    
    UIImageView *images=[[UIImageView alloc]init];
    images.image = [UIImage imageNamed:@"bj_baobei"];
    [addView addSubview:images];
    
    PublicLabel *titleLabel=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"您尚未维护送货地址，现在去设置?" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [addView addSubview:titleLabel];
    
   PublicButton *addButton=[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"添加新地址" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:1.00 green:0.31 blue:0.01 alpha:1.00] addView:addView target:self action:@selector(addAddressClick)];
    addButton.layer.cornerRadius=5;
    
    
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(0);
        make.centerY.mas_equalTo(self.view.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreenWidth, KScreenWidth));
    }];
    
    [images mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(addView.mas_centerX).offset(0);
        make.top.mas_equalTo(addView.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(150, 150));
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(addView.mas_centerY).mas_equalTo(20);
        make.centerX.mas_equalTo(addView.mas_centerX).offset(0);
    }];
    
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(20);
        make.centerX.mas_equalTo(addView.mas_centerX).offset(0);
        make.left.mas_equalTo(addView.mas_left).offset(40);
        make.right.mas_equalTo(addView.mas_right).offset(-40);
        make.height.mas_offset(@40);
    }];
    
    
    
    
}
//新增收货地址
- (void)addAddressClick{
    NewReceiptAddressViewController *newReceiptAddress=[[NewReceiptAddressViewController alloc]init];
    [self.navigationController pushViewController:newReceiptAddress animated:YES];
}

@end
