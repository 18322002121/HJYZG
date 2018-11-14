//
//  ANewHouseViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/3.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ANewHouseViewController.h"
#import "ANewHouseViewCell.h"
#import "ANewHouseMoreInformationViewController.h"
#import "CompleteFiveEvidenceViewController.h"
#import "OnlineHouseViewController.h"
#import "RealEstateDisplayViewController.h"
#import "NewsDynamicCell.h"
#import "NewsDynamicViewController.h"

@interface ANewHouseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

static NSString *const newsDynamicCell = @"NewsDynamicCell";

@implementation ANewHouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新房";
    self.view.backgroundColor = kRandomColor;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self reloadBottomView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-50) style:UITableViewStyleGrouped];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[NewsDynamicCell class] forCellReuseIdentifier:newsDynamicCell];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *temporaryCell =nil;
    if (indexPath.section == 1) {
        NewsDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:newsDynamicCell];
        temporaryCell = cell;
    }else{
        static NSString *str=@"ANewHouseViewCell";
        ANewHouseViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if (cell==nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        [self reloadANewHouseViewCell:cell];
        temporaryCell = cell;
    }
    return temporaryCell;
}

- (void)rowHeiht:(ANewHouseViewCell *)cell{
    _tableView.rowHeight = cell.frame.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==1) {
        return 80;
    }else{
        return 604;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.01;
    }else{
        return 40;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[UIView alloc]init];
    if (section == 0) {
        headerView.frame = CGRectMake(0, kTopHeight, KScreenWidth, 0.01);
    }else{
        headerView.frame = CGRectMake(0, kTopHeight, KScreenWidth, 40);
        PublicLabel *sectionTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"最新动态(2)" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [headerView addSubview:sectionTitle];
        [sectionTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(headerView.mas_left).offset(20);
            make.centerY.mas_equalTo(headerView.mas_centerY).offset(0);
        }];
        
        PublicButton *showMore = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"箭头_右" backgroundImageImage:@"" title:@"查看更多" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:11.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(showMoreClick)];
        [showMore mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(headerView.mas_centerY).offset(0);
            make.right.mas_equalTo(headerView.mas_right).offset(-20);
        }];
    }
    
    return headerView;
}

- (void)showMoreClick{
    NewsDynamicViewController *newsDynamic = [[NewsDynamicViewController alloc]init];
    [self.navigationController pushViewController:newsDynamic animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    return subView;
}

//加载底部悬浮view
- (void)reloadBottomView{
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    
     PublicButton *wantToRent =[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"zufang" backgroundImageImage:@"" title:@"" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.93 green:0.57 blue:0.13 alpha:1.00] addView:bottomView target:self action:@selector(wantToRentClick)];
    
    PublicButton *recommendFriends =[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"tuijian" backgroundImageImage:@"" title:@"" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.02 green:0.27 blue:0.68 alpha:1.00] addView:bottomView target:self action:@selector(recommendFriendsClick)];
    
    PublicButton *onlineHouse =[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"goufang" backgroundImageImage:@"" title:@"" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:1.00 green:0.25 blue:0.15 alpha:1.00] addView:bottomView target:self action:@selector(onlineHouseClick)];
    
    [self.view addSubview:bottomView];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
        make.height.mas_offset(@50);
    }];
    
    [@[wantToRent,recommendFriends,onlineHouse] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:0 tailSpacing:0];
    
    [@[wantToRent,recommendFriends,onlineHouse] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomView.mas_centerY).offset(0);
        make.height.mas_equalTo(50);
    }];
}

//我要租房
- (void)wantToRentClick{
    
}
//推荐好友买房
- (void)recommendFriendsClick{
    
}
//在线看房
- (void)onlineHouseClick{
    OnlineHouseViewController *onlineHouse = [[OnlineHouseViewController alloc]init];
    [self.navigationController pushViewController:onlineHouse animated:YES];
}


#pragma mark - 加载 ANewHouseViewCell逻辑处理
- (void)reloadANewHouseViewCell:(ANewHouseViewCell *)cell{
    
    //abnner图点击事件
    cell.aNewHouseSelectIndex = ^(UITapGestureRecognizer *taps) {
        RealEstateDisplayViewController *realEstateDisplay = [[RealEstateDisplayViewController alloc]init];
        [self.navigationController pushViewController:realEstateDisplay animated:YES];
    };
    
    //地图定位
    cell.mapPositioningButton = ^(UIButton *sender) {
        NSLog(@"地图定位");
    };
    //更多信息
    cell.moreInformationButton = ^(UIButton *sender) {
        ANewHouseMoreInformationViewController *aNewHouseMoreInformation = [[ANewHouseMoreInformationViewController alloc]init];
        [self.navigationController pushViewController:aNewHouseMoreInformation animated:YES];
    };
    //五证齐全
    cell.completeFiveEvidenceButton = ^(UIButton *sender) {
        CompleteFiveEvidenceViewController *completeFiveEvidence = [[CompleteFiveEvidenceViewController alloc]init];
        [self.navigationController pushViewController:completeFiveEvidence animated:YES];
    };
    //开盘通知
    cell.openingNoticeButton = ^(UIButton *sender) {
        
    };
    //免费致电
    cell.freeCallButton = ^(UIButton *sender) {
        NSLog(@"免费致电");
    };
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        NewsDynamicViewController *newsDynamic = [[NewsDynamicViewController alloc]init];
        [self.navigationController pushViewController:newsDynamic animated:YES];
    }
}



@end
