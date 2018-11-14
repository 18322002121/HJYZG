//
//  CommodityDetailsViewController.m
//  HJYZG
//
//  Created by HCY on 2018/9/13.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "CommodityDetailsViewController.h"
#import "CommodityDetailsCell.h"

@interface CommodityDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation CommodityDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"商品详情";
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
//    [_tableView registerNib:[UINib nibWithNibName:@"ReimbursementHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"ReimbursementHeaderView"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"CommodityDetailsCell";
    CommodityDetailsCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell==nil)
        
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    _tableView.rowHeight = cell.frame.size.height;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    ReimbursementHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ReimbursementHeaderView"];
//    headerView.backgroundColor=[UIColor whiteColor];
//    _tableView.sectionHeaderHeight=headerView.frame.size.height;
//    return headerView;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    return subView;
}

@end
