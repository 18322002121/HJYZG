//
//  BuyHouseViewController.m
//  HJYZG
//
//  Created by HCY on 2018/9/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "BuyHouseViewController.h"
#import "BuyHouseTableViewCell.h"
#import "ANewHouseViewController.h"
@interface BuyHouseViewController ()<UITableViewDelegate,UITableViewDataSource,LrdSuperMenuDelegate,LrdSuperMenuDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) LrdSuperMenu *menu;
@property (nonatomic,strong) NSArray *classifyArray;
@property (nonatomic,strong) NSArray *theWholeCityArray;
@property (nonatomic,strong) NSArray *intelligentSortingArray;
@property (nonatomic,strong) NSArray *screenArray;

@end

@implementation BuyHouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我要买房";
    [self createTable];
    [self reloadTopHeaderView];
//    [self dropDownSelectionBox];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight + 40, KScreenWidth, KScreenHeight-40-kTopHeight) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"BuyHouseTableViewCell";
    BuyHouseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil)
        
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    _tableView.rowHeight = cell.frame.size.height;
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
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    return subView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ANewHouseViewController *aNewHouseView=[[ANewHouseViewController alloc]init];
    [self.navigationController pushViewController:aNewHouseView animated:YES];
}

//加载导航栏下面固定view
- (void)reloadTopHeaderView{
    self.classifyArray =  @[@"区域", @"华龙区", @"高新区", @"濮阳县", @"清丰县", @"南乐县", @"台前县", @"范县", @"滑县"];
    self.theWholeCityArray = @[@"价格", @"4000-5000", @"5000-6000", @"6000-7000", @"7000-8000", @"8000-9000", @"1000以上"];
    self.intelligentSortingArray = @[@"状态", @"在售", @"已售"];
    self.screenArray = @[@"类型", @"住宅", @"商品房", @"垃圾房", @"高楼", @"底层", @"地下室"];
    _menu = [[LrdSuperMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:40];
    _menu.delegate = self;
    _menu.dataSource = self;
    [self.view addSubview:_menu];
    [_menu selectDeafultIndexPath];
}
- (NSInteger)numberOfColumnsInMenu:(LrdSuperMenu *)menu {
    return 4;
}

- (NSInteger)menu:(LrdSuperMenu *)menu numberOfRowsInColumn:(NSInteger)column {
    if (column == 0) {
        return self.classifyArray.count;
    }else if(column == 1) {
        return self.theWholeCityArray.count;
    }else if(column == 2){
        return self.intelligentSortingArray.count;
    }else{
        return self.screenArray.count;
    }
}

- (NSString *)menu:(LrdSuperMenu *)menu titleForRowAtIndexPath:(LrdIndexPath *)indexPath {
    if (indexPath.column == 0) {
        return self.classifyArray[indexPath.row];
    }else if(indexPath.column == 1) {
        return self.theWholeCityArray[indexPath.row];
    }else if(indexPath.column == 2){
        return self.intelligentSortingArray[indexPath.row];
    }else{
        return self.screenArray[indexPath.row];
    }
}

- (void)menu:(LrdSuperMenu *)menu didSelectRowAtIndexPath:(LrdIndexPath *)indexPath {
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
}


@end
