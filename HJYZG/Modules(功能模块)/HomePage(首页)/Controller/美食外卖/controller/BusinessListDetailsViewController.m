//
//  BusinessListDetailsViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/7.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "BusinessListDetailsViewController.h"
#import "BusinessListDetailsCell.h"

@interface BusinessListDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end
static NSString *const businessListDetailsCell = @"BusinessListDetailsCell";
@implementation BusinessListDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    self.title = @"商品详情";
    self.tableView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[BusinessListDetailsCell class] forCellReuseIdentifier:businessListDetailsCell];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BusinessListDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:businessListDetailsCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 330;
    }else{
        return 40;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]init];;
    if (section == 0) {
        headerView.frame = CGRectMake(0, 0, KScreenWidth, 330);
        UIView * bannerView = [[UIView alloc]init];
        bannerView.backgroundColor = kRandomColor;
        [headerView addSubview:bannerView];
        
        [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(headerView.mas_top).offset(0);
            make.left.mas_equalTo(headerView.mas_left).offset(0);
            make.right.mas_equalTo(headerView.mas_right).offset(0);
            make.height.mas_offset(@120);
        }];
        
        PublicLabel *shopTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"酱骨头排骨饭" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [headerView addSubview:shopTitle];
        
        [shopTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(bannerView.mas_bottom).offset(5);
            make.left.mas_equalTo(headerView.mas_left).offset(10);
        }];
        UIView *starView = [[UIView alloc]init];
        starView.backgroundColor = [UIColor redColor];
        [headerView addSubview:starView];
        
        [starView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(headerView.mas_left).offset(10);
            make.top.mas_equalTo(shopTitle.mas_bottom).offset(5);
            make.size.mas_equalTo(CGSizeMake(60, 20));
        }];
        
        PublicLabel *scoreLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"4.8分(1284人评)" textColor:[UIColor blackColor] font:[UIFont        systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [headerView addSubview:scoreLabel];
        
        [scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(starView.mas_centerY).offset(0);
            make.left.mas_equalTo(starView.mas_right).offset(5);
        }];
        
        PublicLabel *lineLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor grayColor]];
        [headerView addSubview:lineLabel];
        
        [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(scoreLabel.mas_right).offset(5);
            make.centerY.mas_equalTo(starView.mas_centerY).offset(0);
            make.size.mas_equalTo(CGSizeMake(1, 10));
        }];
        
        PublicLabel *priceLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"¥18/人" textColor:[UIColor blackColor] font:[UIFont        systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [headerView addSubview:priceLabel];
        
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lineLabel.mas_right).offset(5);
            make.centerY.mas_equalTo(starView.mas_centerY).offset(0);
        }];
        
        UIImageView *restImage = [[UIImageView alloc]init];
        restImage.backgroundColor = [UIColor greenColor];
        [headerView addSubview:restImage];
        
        [restImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(starView.mas_bottom).offset(5);
            make.left.mas_equalTo(headerView.mas_left).offset(10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        PublicLabel *restLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"21:00打烊" textColor:[UIColor blackColor] font:[UIFont        systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [headerView addSubview:restLabel];
        
        [restLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(restImage.mas_centerY).offset(0);
            make.left.mas_equalTo(restImage.mas_right).offset(5);
        }];
        
        PublicButton *addressButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleLeft) image:@"地理位置" backgroundImageImage:@"" title:@"华龙区黄河路与安居街交叉口向北30米路西" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:11.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(addressClick)];
        
        [addressButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(headerView.mas_left).offset(10);
            make.top.mas_equalTo(restImage.mas_bottom).offset(5);
        }];
        
        UIImageView *shopStoreImage = [[UIImageView alloc]init];
        shopStoreImage.backgroundColor = [UIColor orangeColor];
        [headerView addSubview:shopStoreImage];
        
        [shopStoreImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(starView.mas_centerY).offset(0);
            make.right.mas_equalTo(headerView.mas_right).offset(-10);
            make.size.mas_equalTo(CGSizeMake(80, 60));
        }];
        
        PublicButton *callPhoneButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleLeft) image:@"电话" backgroundImageImage:@"" title:@"" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:11.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(callPhoneClick)];
        
        [callPhoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(headerView.mas_right).offset(-10);
            make.centerY.mas_equalTo(addressButton.mas_centerY).offset(0);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        UIImageView *waimaiIcon = [[UIImageView alloc]init];
        waimaiIcon.backgroundColor = [UIColor redColor];
        [headerView addSubview:waimaiIcon];
        
        [waimaiIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(headerView.mas_left).offset(10);
            make.top.mas_equalTo(addressButton.mas_bottom).offset(5);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        PublicButton *waimaiButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"箭头_右" backgroundImageImage:@"" title:@"外卖" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:11.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(waimaiClick)];
        
        [waimaiButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(waimaiIcon.mas_right).offset(5);
            make.centerY.mas_equalTo(waimaiIcon.mas_centerY).offset(0);
        }];
        
        //优惠信息
        PublicButton *preferentialInformation = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"优惠信息" titleColor:[UIColor colorWithRed:0.19 green:0.60 blue:0.56 alpha:1.00] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(preferentialInformationClick)];
        
        //用户评论
        PublicButton *userReviews = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"用户评论" titleColor:[UIColor colorWithRed:0.19 green:0.60 blue:0.56 alpha:1.00] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(userReviewsClick)];
        
        //商家信息
         PublicButton *businessInformation = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"商家信息" titleColor:[UIColor colorWithRed:0.19 green:0.60 blue:0.56 alpha:1.00] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(businessInformationClick)];
        
        [@[preferentialInformation,userReviews,businessInformation] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:0 tailSpacing:0];
        
        [@[preferentialInformation,userReviews,businessInformation] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(waimaiIcon.mas_bottom).offset(5);
            make.height.mas_equalTo(30);
        }];
        
        PublicLabel *preferentialInformationLine = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor blackColor] font:[UIFont        systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithRed:0.19 green:0.60 blue:0.56 alpha:1.00]];
        [headerView addSubview:preferentialInformationLine];
        [preferentialInformationLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(preferentialInformation.mas_bottom).offset(1);
            make.centerX.mas_equalTo(preferentialInformation.mas_centerX).offset(0);
            make.size.mas_equalTo(CGSizeMake(60, 2));
        }];
        
        PublicLabel *userReviewsLine = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor blackColor] font:[UIFont        systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithRed:0.19 green:0.60 blue:0.56 alpha:1.00]];
        [headerView addSubview:userReviewsLine];
        [userReviewsLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(userReviews.mas_bottom).offset(1);
            make.centerX.mas_equalTo(userReviews.mas_centerX).offset(0);
            make.size.mas_equalTo(CGSizeMake(60, 2));
        }];
        
        PublicLabel *businessInformationLine = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor blackColor] font:[UIFont        systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithRed:0.19 green:0.60 blue:0.56 alpha:1.00]];
        [headerView addSubview:businessInformationLine];
        [businessInformationLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(businessInformation.mas_bottom).offset(1);
            make.centerX.mas_equalTo(businessInformation.mas_centerX).offset(0);
            make.size.mas_equalTo(CGSizeMake(60, 2));
        }];
        
        PublicLabel *setMealLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"堂食套餐" textColor:[UIColor blackColor] font:[UIFont        systemFontOfSize:16.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [headerView addSubview:setMealLabel];
        
        [setMealLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(headerView.mas_left).offset(10);
            make.top.mas_equalTo(preferentialInformationLine.mas_bottom).offset(10);
        }];
        
    
    }else{
        headerView.frame = CGRectMake(0, 0, KScreenWidth, 44);
    }
   
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)addressClick{
    NSLog(@"地址选择");
}

- (void)callPhoneClick{
    NSLog(@"打电话");
}

- (void)waimaiClick{
    NSLog(@"外卖按钮");
}

//优惠信息
- (void)preferentialInformationClick{
    NSLog(@"优惠信息");
}

//用户评论
- (void)userReviewsClick{
    NSLog(@"用户评论");
}

//商家信息
- (void)businessInformationClick{
    NSLog(@"商家信息");
}





@end
