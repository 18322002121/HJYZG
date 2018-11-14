//
//  BuildingInformationViewController.m
//  HJYZG
//
//  Created by HCY on 2018/9/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "BuildingInformationViewController.h"
#import "BuildingInformationCell.h"
#import "ListShowViewController.h"
#import "SubscriptionFormViewController.h"

@interface BuildingInformationViewController ()<UITableViewDelegate,UITableViewDataSource,BMKLocationManagerDelegate,BMKMapViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong)BMKLocationManager *locService;
@property (nonatomic, strong)BMKMapView *mapView;

@end

@implementation BuildingInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"楼盘详情";
    self.view.backgroundColor=kRandomColor;
    [self createTable];
    [self reloadHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight+40, KScreenWidth, KScreenHeight-40-kTopHeight) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"BuildingInformationCell";
    BuildingInformationCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil)
        
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    _tableView.rowHeight = cell.frame.size.height;
    [self reloadBuildingInformationCell:cell cellForRowAtIndexPath:indexPath];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SubscriptionFormViewController *subscriptionForm=[[SubscriptionFormViewController alloc]init];
    [self.navigationController pushViewController:subscriptionForm animated:YES];
}

- (void)reloadHeaderView{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, kTopHeight, KScreenWidth, 40)];
    headerView.backgroundColor=KWhiteColor;
    [self.view addSubview:headerView];
    
    PublicLabel *firstLabel=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"序号" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.view addSubview:firstLabel];
    
    PublicLabel *secondLabel=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"面积(m²)" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.view addSubview:secondLabel];
    
    PublicLabel *thirdLabel=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"单价(元)" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.view addSubview:thirdLabel];
    
    PublicLabel *fourthLabel=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"总价(m²)" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.view addSubview:fourthLabel];
    
    PublicLabel *fiveLabel=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"状态" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [self.view addSubview:fiveLabel];
    
    [@[firstLabel,secondLabel,thirdLabel,fourthLabel,fiveLabel] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:0 tailSpacing:0];
    
    [@[firstLabel,secondLabel,thirdLabel,fourthLabel,fiveLabel] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(headerView.mas_centerY).offset(0);
        make.height.mas_equalTo(40);
    }];
}

- (void)reloadBuildingInformationCell:(BuildingInformationCell *)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *dataArr=[NSMutableArray array];
    for (int i=0; i<10; i++) {
        [dataArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    cell.serialNumber.text=dataArr[indexPath.row];
    NSLog(@"%@",dataArr);
    
    
    
    
}





////加载百度地图
//- (void)reloadBaiduMapView:(BuildingInformationCell *)cell{
//    self.mapView=[[BMKMapView alloc]init];
//    self.mapView.delegate=self;
//    [cell.mapView addSubview:self.mapView];
//
//    BMKLocationViewDisplayParam *param = [[BMKLocationViewDisplayParam alloc] init];
//    //线
//    param.accuracyCircleStrokeColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5];
//    //圈
//    //    param.accuracyCircleFillColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2];
//    [_mapView updateLocationViewWithParam:param];
//    [_mapView setZoomLevel:13];
//
//    _locService = [[BMKLocationManager alloc]init];//定位功能的初始化
//    _locService.delegate = self;//设置代理位self
//    [_locService startUserLocationService];//启动定位服务
//    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
//    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
//    _mapView.showsUserLocation = YES;//显示定位图层
//
//    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(cell.mapView.mas_top).offset(0);
//        make.left.mas_equalTo(cell.mapView.mas_left).offset(0);
//        make.right.mas_equalTo(cell.mapView.mas_right).offset(0);
//        make.bottom.mas_equalTo(cell.mapView.mas_bottom).offset(0);
//    }];
//
//}
//- (void)viewWillDisappear:(BOOL)animated {
//    [_mapView viewWillDisappear];
//    _mapView.delegate = nil; // 不用时，置nil
//    _locService.delegate = nil;
//}
//
//- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
//{
//    [_mapView updateLocationData:userLocation];
//    NSLog(@"heading is %@",userLocation.heading);
//}
//
///**
// *用户位置更新后，会调用此函数
// *@param userLocation 新的用户位置
// */
//- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
//{
//    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
//    [_mapView updateLocationData:userLocation];
//}




@end
