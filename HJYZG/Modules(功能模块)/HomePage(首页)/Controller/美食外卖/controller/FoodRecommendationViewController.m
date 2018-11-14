//
//  FoodRecommendationViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/8.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "FoodRecommendationViewController.h"
#import "FoodRecommendationViewHeaderCell.h"
#import "FoodRecommendationdetailsViewCenterCell.h"
#import "FoodRecommendationViewBottomCell.h"
#import "FoodRecommendationParametersCell.h"
#import "FoodRecommendationReviewsCell.h"
#import "FoodMaterialsCell.h"


@interface FoodRecommendationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITableView *showtableView;
@property (nonatomic,assign) NSInteger isStates;
@property (nonatomic,strong) UIView *showTableViewBottom;
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) PublicLabel *totalPrice;
@end

static NSString *const foodRecommendationViewHeaderCell = @"FoodRecommendationViewHeaderCell";
static NSString *const foodRecommendationdetailsViewCenterCell = @"FoodRecommendationdetailsViewCenterCell";
static NSString *const foodRecommendationViewBottomCell = @"FoodRecommendationViewBottomCell";
static NSString *const foodRecommendationParametersCell = @"FoodRecommendationParametersCell";
static NSString *const foodRecommendationReviewsCell = @"FoodRecommendationReviewsCell";
static NSString *const foodMaterialsCell = @"FoodMaterialsCell";

@implementation FoodRecommendationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"美食推荐";
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self reloadBottomView];
    self.isStates = 1;
    [self reloadCancelAndDetermine];
}

- (void)reloadCancelAndDetermine{
    _backView = [[UIView alloc]initWithFrame:CGRectMake(KScreenWidth, 100, KScreenWidth, 450)];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.layer.borderColor = [UIColor colorWithRed:0.33 green:0.21 blue:0.42 alpha:1.00].CGColor;
    _backView.layer.borderWidth = 1;
    _backView.layer.cornerRadius = 15;
    [self.view addSubview:_backView];
    
    _showtableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, KScreenWidth, 300) style:(UITableViewStyleGrouped)];
    _showtableView.delegate = self;
    _showtableView.dataSource = self;
    [_showtableView registerClass:[FoodMaterialsCell class] forCellReuseIdentifier:foodMaterialsCell];
    [self.backView addSubview:_showtableView];
    
    _totalPrice = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"合计：128" textColor:[UIColor redColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [_backView addSubview:_totalPrice];
    
    [_totalPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.showtableView.mas_bottom).offset(10);
        make.right.mas_equalTo(self.backView.mas_right).offset(-10);
    }];
    
    PublicButton *cancel = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"取消" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:kRandomColor addView:self.backView target:self action:@selector(cancelClick)];
    cancel.layer.cornerRadius = 15;
    
    PublicButton *determine = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"确定" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:kRandomColor addView:self.backView target:self action:@selector(determineClick)];
    determine.layer.cornerRadius = 15;
    
    [@[cancel,determine] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:0 tailSpacing:0];
    
    [@[cancel,determine] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.totalPrice.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-60) style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[FoodRecommendationViewHeaderCell class] forCellReuseIdentifier:foodRecommendationViewHeaderCell];
        [_tableView registerClass:[FoodRecommendationdetailsViewCenterCell class] forCellReuseIdentifier:foodRecommendationdetailsViewCenterCell];
        [_tableView registerClass:[FoodRecommendationViewBottomCell class] forCellReuseIdentifier:foodRecommendationViewBottomCell];
        [_tableView registerClass:[FoodRecommendationParametersCell class] forCellReuseIdentifier:foodRecommendationParametersCell];
        [_tableView registerClass:[FoodRecommendationReviewsCell class] forCellReuseIdentifier:foodRecommendationReviewsCell];
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        [self.view addSubview:_tableView];
    }
    return _tableView;

}

//- (UITableView *)showtableView{
//    _showtableView = [[UITableView alloc]initWithFrame:CGRectMake(KScreenWidth, 200, KScreenWidth, 300) style:(UITableViewStyleGrouped)];
//    _showtableView.backgroundColor = [UIColor greenColor];
//    _showtableView.delegate = self;
//    _showtableView.dataSource = self;
//    [_showtableView registerClass:[CeshiTableViewCell class] forCellReuseIdentifier:ceshiTableViewCell];
//    [self.view addSubview:_showtableView];
//    return _showtableView;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([tableView isEqual:self.tableView]) {
        return 3;
    }else{
        return 1;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:self.tableView]) {
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
    }else{
        return 10;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *shopdetailscell = nil;
    if ([tableView isEqual:self.tableView]) {
        if (indexPath.section == 0) {
            FoodRecommendationViewHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:foodRecommendationViewHeaderCell];
            cell.specificationsButton = ^(UIButton *sender) {
                NSLog(@"按钮点击事件");
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.backView.frame = CGRectMake(0, 100, KScreenWidth, 450);
                } completion:^(BOOL finished) {
                    
                }];
                
            };
            shopdetailscell = cell;
        }else if (indexPath.section == 1){
            FoodRecommendationdetailsViewCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:foodRecommendationdetailsViewCenterCell];
            shopdetailscell = cell;
        }else if (indexPath.section == 2){
            if (_isStates == 1) {
                FoodRecommendationViewBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:foodRecommendationViewBottomCell];
                NSArray *dataArr = [NSArray arrayWithObjects:@"shop1.jpg",@"shop2.jpg",@"shop3.jpg",@"shop4.jpg",@"shop5.jpg", nil];
                cell.imageViews.image = [UIImage imageNamed:dataArr[indexPath.row]];
                shopdetailscell = cell;
            }else if (_isStates == 2){
                FoodRecommendationParametersCell *cell = [tableView dequeueReusableCellWithIdentifier:foodRecommendationParametersCell];
                cell.separatorInset = UIEdgeInsetsMake(0, KScreenWidth, 0, 0);
                shopdetailscell = cell;
            }else{
                FoodRecommendationReviewsCell *cell = [tableView dequeueReusableCellWithIdentifier:foodRecommendationReviewsCell];
                cell.separatorInset = UIEdgeInsetsMake(0, KScreenWidth, 0, 0);
                shopdetailscell = cell;
            }
        }
    }else{
         
        FoodMaterialsCell *cell = [tableView dequeueReusableCellWithIdentifier:foodMaterialsCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        shopdetailscell = cell;
    }
    return shopdetailscell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.tableView]) {
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
    }else{
        return 80;
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
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    return subView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NSLog(@"跳转");
    }else if (indexPath.section == 1){
//        ShopHomePageViewController *shopHomePage = [[ShopHomePageViewController alloc]init];
//        [self.navigationController pushViewController:shopHomePage animated:YES];
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

//联系电话
- (void)customerServiceClick{
    
}

//加入购物车
- (void)addToCartClick{
    
//    ShoppingCartViewController *shoppingCart = [[ShoppingCartViewController alloc]init];
//    [self.navigationController pushViewController:shoppingCart animated:YES];
}

//立即购买
- (void)purchaseImmediatelyClick{
//    ConfirmationOfOrderViewController *confirmationOfOrder = [[ConfirmationOfOrderViewController alloc]init];
//    [self.navigationController pushViewController:confirmationOfOrder animated:YES];
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

//取消
- (void)cancelClick{
    
//    [self.showTableViewBottom removeFromSuperview];
//    [self.showtableView removeFromSuperview];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.backView.frame = CGRectMake(KScreenWidth, 100, KScreenWidth, 450);
//        self.showtableView.frame = CGRectMake(KScreenWidth, 200, KScreenWidth, 300);
    }];
}


//确定
- (void)determineClick{
    [UIView animateWithDuration:0.5 animations:^{
        self.backView.frame = CGRectMake(KScreenWidth, 100, KScreenWidth, 450);
//        self.showtableView.frame = CGRectMake(KScreenWidth, 200, KScreenWidth, 300);
    }];
}


@end
