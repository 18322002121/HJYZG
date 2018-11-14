//
//  ShopdetailsViewController.m
//  HJYZG
//
//  Created by HCY on 2018/9/25.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ShopdetailsViewController.h"
#import "ShopdetailsViewHeaderCell.h"
#import "ShopdetailsViewCenterCell.h"
#import "ShopdetailsViewBottomCell.h"
#import "ShopHomePageViewController.h"
#import "CommodityParametersCell.h"
#import "CommodityReviewsCell.h"
#import "ConfirmationOfOrderViewController.h"
#import "ShoppingCartViewController.h"
#import <UIKit/UIKit.h>

@interface ShopdetailsViewController ()<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) NSInteger isStates;
@end

static NSString *const shopdetailsViewHeaderCell = @"ShopdetailsViewHeaderCell";
static NSString *const shopdetailsViewCenterCell = @"ShopdetailsViewCenterCell";
static NSString *const shopdetailsViewBottomCell = @"ShopdetailsViewBottomCell";

static NSString *const commodityParametersCell = @"CommodityParametersCell";
static NSString *const commodityReviewsCell = @"CommodityReviewsCell";
@implementation ShopdetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self reloadBottomView];
    self.isStates = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-60) style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ShopdetailsViewHeaderCell class] forCellReuseIdentifier:shopdetailsViewHeaderCell];
        [_tableView registerClass:[ShopdetailsViewCenterCell class] forCellReuseIdentifier:shopdetailsViewCenterCell];
        [_tableView registerClass:[ShopdetailsViewBottomCell class] forCellReuseIdentifier:shopdetailsViewBottomCell];
        [_tableView registerNib:[UINib nibWithNibName:commodityParametersCell bundle:nil] forCellReuseIdentifier:commodityParametersCell];
        [_tableView registerNib:[UINib nibWithNibName:commodityReviewsCell bundle:nil] forCellReuseIdentifier:commodityReviewsCell];
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }else{
        
        if (self.isStates == 1) {
            return 5;
        }else if (self.isStates == 2){
            return 5;
        }else{
            return 3;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *shopdetailscell = nil;
    if (indexPath.section == 0) {
        ShopdetailsViewHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:shopdetailsViewHeaderCell];
        shopdetailscell = cell;
    }else if (indexPath.section == 1){
        ShopdetailsViewCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:shopdetailsViewCenterCell];
        shopdetailscell = cell;
    }else if (indexPath.section == 2){
        if (_isStates == 1) {
            ShopdetailsViewBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:shopdetailsViewBottomCell];
            NSArray *dataArr = [NSArray arrayWithObjects:@"shop1.jpg",@"shop2.jpg",@"shop3.jpg",@"shop4.jpg",@"shop5.jpg", nil];
            cell.imageViews.image = [UIImage imageNamed:dataArr[indexPath.row]];
            shopdetailscell = cell;
        }else if (_isStates == 2){
            CommodityParametersCell *cell = [tableView dequeueReusableCellWithIdentifier:commodityParametersCell];
            cell.separatorInset = UIEdgeInsetsMake(0, KScreenWidth, 0, 0);
            shopdetailscell = cell;
        }else{
            CommodityReviewsCell *cell = [tableView dequeueReusableCellWithIdentifier:commodityReviewsCell];
            cell.separatorInset = UIEdgeInsetsMake(0, KScreenWidth, 0, 0);
            shopdetailscell = cell;
        }
    }
    return shopdetailscell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 400;
    }else if (indexPath.section == 1){
        return 100;
    }else{
        if (_isStates == 1) {
            return 240;
        }else if (_isStates == 2){
            return 30;
        }else{
            return 30;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        return 0.01;
    }else{
        return 40;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *subView=[[UIView alloc]init];
    if (section == 0 || section == 1) {
        subView.frame = CGRectMake(0, 0, KScreenWidth, 0.01);
    }else{
        subView.frame = CGRectMake(0, 0, KScreenWidth, 40);
        //商品详情
        PublicButton *commodityDetails =[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"商品详情" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00] addView:subView target:self action:@selector(commodityDetailsClick)];
        //商品参数
        PublicButton *commodityParameters =[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"商品参数" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00] addView:subView target:self action:@selector(commodityParametersClick)];
        //商品评论
         PublicButton *commodityReviews =[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"商品评论" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00] addView:subView target:self action:@selector(commodityReviewsClick)];
        
        [@[commodityDetails,commodityParameters,commodityReviews] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:0 tailSpacing:0];
        
        [@[commodityDetails,commodityParameters,commodityReviews] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(subView.mas_centerY).offset(0);
            make.height.mas_equalTo(40);
        }];
    }
    return subView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    return subView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NSLog(@"跳转");
    }else if (indexPath.section == 1){
        ShopHomePageViewController *shopHomePage = [[ShopHomePageViewController alloc]init];
        [self.navigationController pushViewController:shopHomePage animated:YES];
    }else if (indexPath.section == 2){
        NSLog(@"跳转");
    }
}

//加载底部悬浮view
- (void)reloadBottomView{
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.00];
    PublicButton *shopStore = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleTop) image:@"ic_home" backgroundImageImage:@"" title:@"店铺" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:11.0] backgroundColor:[UIColor clearColor] addView:bottomView target:self action:@selector(shopStoreClick)];
    
    PublicButton *customerService = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleTop) image:@"zhuangxiu" backgroundImageImage:@"" title:@"客服" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:11.0] backgroundColor:[UIColor clearColor] addView:bottomView target:self action:@selector(customerServiceClick)];
    
    PublicButton *addToCart =[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"加入购物车" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor grayColor] addView:bottomView target:self action:@selector(addToCartClick)];
    
    PublicButton *purchaseImmediately =[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"立即购买" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor grayColor] addView:bottomView target:self action:@selector(purchaseImmediatelyClick)];
    
    [self.view addSubview:bottomView];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
        make.height.mas_offset(@60);
    }];
    
    [@[shopStore,customerService,purchaseImmediately,addToCart] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    
    [@[shopStore,customerService,purchaseImmediately,addToCart] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomView.mas_centerY).offset(0);
        make.height.mas_equalTo(40);
    }];
}
//商铺
- (void)shopStoreClick{
    
}

//客服
- (void)customerServiceClick{
    NSString  *qqNumber=@"987526345";
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
        NSURL * url=[NSURL URLWithString:[NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",qqNumber]];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        webView.delegate = self;
        [webView loadRequest:request];
        [self.view addSubview:webView];
    }else{
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"nil" message:@"对不起，您还没安装QQ" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            return ;
        }];
        
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }

}

//加入购物车
- (void)addToCartClick{

    ShoppingCartViewController *shoppingCart = [[ShoppingCartViewController alloc]init];
    [self.navigationController pushViewController:shoppingCart animated:YES];
}

//立即购买
- (void)purchaseImmediatelyClick{
    ConfirmationOfOrderViewController *confirmationOfOrder = [[ConfirmationOfOrderViewController alloc]init];
    [self.navigationController pushViewController:confirmationOfOrder animated:YES];
}

//商品详情
- (void)commodityDetailsClick{
    self.isStates = 1;
    //section刷新
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:2];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView setContentOffset:CGPointZero animated:YES];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2] atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
}
//商品参数
- (void)commodityParametersClick{
    self.isStates = 2;
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:2];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView setContentOffset:CGPointZero animated:YES];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2] atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
}
//商品评论
- (void)commodityReviewsClick{
    self.isStates = 3;
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:2];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView setContentOffset:CGPointZero animated:YES];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2] atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
}

@end
