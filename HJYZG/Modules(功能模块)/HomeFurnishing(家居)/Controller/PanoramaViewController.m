//
//  PanoramaViewController.m
//  HJYZG
//
//  Created by HCY on 2018/9/24.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "PanoramaViewController.h"
#import "PanoramaCell.h"
#import "GoodsClassificationModel.h"

@interface PanoramaViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) NSMutableArray *goodsClassficationArray;
@end

static NSString *const panoramaCell = @"PanoramaCell";
@implementation PanoramaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"方案展示";
    self.view.backgroundColor = kRandomColor;
    self.tableview.backgroundColor = [UIColor whiteColor];
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.showsVerticalScrollIndicator= NO;
        [_tableview registerClass:[PanoramaCell class] forCellReuseIdentifier:panoramaCell];
        [self.view addSubview:_tableview];
    }
    return _tableview;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.goodsClassficationArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PanoramaCell *cell = [tableView dequeueReusableCellWithIdentifier:panoramaCell forIndexPath:indexPath];
    cell.goodsClassModel = self.goodsClassficationArray[indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 44)];
    NSArray *array = [NSArray arrayWithObjects:@"效果图",@"主餐厅",@"客厅",@"阳台",@"卧室",@"厨房",@"卫生间", nil];
    PublicLabel *titleLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:array[section] textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [subView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(subView.mas_centerY).offset(0);
        make.left.mas_equalTo(subView.mas_left).offset(10);
    }];
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

//加载数据
- (void)reloadData{
    NSArray *dataArray = @[@{@"iconImage":@"zhuangxiu1.jpg",@"gridTitle":@"家居·建材"},
                           @{@"iconImage":@"zhuangxiu2.jpg",@"gridTitle":@"买房·租房"},
                           @{@"iconImage":@"zhuangxiu3.jpg",@"gridTitle":@"装修·日杂"},
                           @{@"iconImage":@"zhuangxiu4.jpg",@"gridTitle":@"汽车·交易"},
                           @{@"iconImage":@"zhuangxiu5.jpg",@"gridTitle":@"超市·外卖"},
                           @{@"iconImage":@"zhuangxiu6.jpg",@"gridTitle":@"美食·外卖"},
                           @{@"iconImage":@"zhuangxiu7.jpg",@"gridTitle":@"家教·国学"},
                           ];
    self.goodsClassficationArray = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *dict in dataArray) {
        [self.goodsClassficationArray addObject:[GoodsClassificationModel initWithDict:dict]];
    }
}


@end
