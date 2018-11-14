//
//  ANewHouseMoreInformationViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/3.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ANewHouseMoreInformationViewController.h"
#import "ANewHouseMoreInformationCell.h"

@interface ANewHouseMoreInformationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end
static NSString *const aNewHouseMoreInformationCell = @"ANewHouseMoreInformationCell";
@implementation ANewHouseMoreInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新房基本信息";
    self.view.backgroundColor = kRandomColor;
    [self createTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_tableView registerClass:[ANewHouseMoreInformationCell class] forCellReuseIdentifier:aNewHouseMoreInformationCell];
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ANewHouseMoreInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:aNewHouseMoreInformationCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, kTopHeight, KScreenWidth, 0.01)];
    return headerView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    subView.backgroundColor = kRandomColor;
    return subView;
}

@end
