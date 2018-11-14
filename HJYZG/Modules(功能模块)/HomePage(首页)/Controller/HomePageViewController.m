//
//  HomePageViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/7.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HomePageViewController.h"
#import "CustemButton.h"
#import "SDCycleScrollView.h"
#import "ShopShowViewController.h"
#import "HomePageMainCell.h"
#import "HomePageCollectionViewCell.h"
#import "SelfHelpTelephoneViewController.h"
#import "GoodsClassificationCell.h"
#import "GoodsClassificationModel.h"
#import "GoodsClassificationHeaderView.h"
#import "ShopsActivityCell.h"
#import "SelectedActivitiesCell.h"
#import "BusinessPlatformViewController.h"
#import "SelectedActivitiesHeaderView.h"
#import "SearchResultViewController.h"
#import "NewActivitiesViewController.h"
#import "HomeFurnishingViewController.h" //家居建材
#import "BuyHouseViewController.h" //买房租房
#import "DecoratingMiscellaneousViewController.h" //装修日杂
#import "AutomobileTradeViewController.h" //汽车交易
#import "SupermarketViewController.h" //超市外卖
#import "GourmetTakeoutViewController.h" //美食外卖
#import "FamilyEducationViewController.h" //家教国学
#import "BeautyBeautyViewController.h" //丽人美妆
#import "AgriculturalViewController.h" //农副产品
#import "EntertainmentViewController.h" //休闲娱乐
#import "HomeadvertisingPositionModel.h"

@interface HomePageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PYSearchViewControllerDelegate>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) PublicButton *leftButton;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *goodsClassficationArray;
@property (nonatomic,strong) NSMutableArray *bannerArray;
@property (nonatomic,strong) NSMutableArray *discountListArray;
@property (nonatomic,strong) NSMutableArray *hotListArray;
@property (nonatomic,strong) NSMutableArray *productListArray;
@property(nonatomic,strong) PublicButton *rightButton;
@property (nonatomic,strong) NSArray *imgArrays;
@end
static NSString *const goodsClassificationCell = @"GoodsClassificationCell";
static NSString *const goodsClassificationHeaderView = @"GoodsClassificationHeaderView";
static NSString *const shopsActivityCell = @"ShopsActivityCell";
static NSString *const selectedActivitiesCell = @"SelectedActivitiesCell";
static NSString *const selectedActivitiesHeaderView = @"SelectedActivitiesHeaderView";


@implementation HomePageViewController

- (NSMutableArray *)bannerArray{
    if (!_bannerArray) {
        _bannerArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _bannerArray;
}

- (NSMutableArray *)discountListArray{
    if (!_discountListArray) {
        _discountListArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _discountListArray;
}

- (NSMutableArray *)hotListArray{
    if (!_hotListArray) {
        _hotListArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _hotListArray;
}

- (NSMutableArray *)productListArray{
    if (!_productListArray) {
        _productListArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _productListArray;
}

- (NSArray *)imgArrays{
    if (!_imgArrays) {
        _imgArrays = [NSMutableArray arrayWithObjects:@"jingxuan1",@"jingxuan2",@"jingxuan3",@"jingxuan4",@"jingxuan5", nil];
    }
    return _imgArrays;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    self.view.backgroundColor=KWhiteColor;
    [self advertisingPosition];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self selectCityDown];
    [self businessPlatform];
    [self reloadUpdata];
    [self addNavigationToTextfield];
    
}

//广告位
- (void)advertisingPosition{
    [HCYRequestManager topAdSuccess:^(id responseObject) {
        [[responseObject[@"data"] objectForKey:@"bannerlist"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Bannerlist *bannerModel = [Bannerlist yy_modelWithJSON:obj];
            [self.bannerArray addObject:bannerModel.path];
        }];
        NSLog(@"%@",self.bannerArray);
        
        [[responseObject[@"data"] objectForKey:@"discountList"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DiscountList *discountListModel = [DiscountList yy_modelWithJSON:obj];
            [self.discountListArray addObject:discountListModel.path];
        }];
        
        [[responseObject[@"data"] objectForKey:@"hotList"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HotList *hotListModel = [HotList yy_modelWithJSON:obj];
            [self.hotListArray addObject:hotListModel.path];
        }];
        
        [[responseObject[@"data"] objectForKey:@"bannerlist"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ProductList *productListModel = [ProductList yy_modelWithJSON:obj];
            [self.productListArray addObject:productListModel.path];
        }];
        
        [self.collectionView reloadData];
    } failure:^(NSError *errorMessage) {
        NSLog(@"%@",errorMessage);
    }];
}

//添加导航输入框
- (void)addNavigationToTextfield{
    PublicTextfield *searchTextfield=[PublicTextfield textFieldWithFrame:CGRectMake(0, 0, 0, 0) background:[UIImage imageNamed:@""] secureTextEntry:NO placeholder:@"请输入您想搜索产品的关键词" clearsOnBeginEditing:YES];
    searchTextfield.font=[UIFont systemFontOfSize:11.0];
    searchTextfield.borderStyle=UITextBorderStyleRoundedRect;
    [searchTextfield addTarget:self action:@selector(searchClickChange:) forControlEvents:UIControlEventEditingDidBegin];
    self.navigationItem.titleView=searchTextfield;
    [searchTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navigationItem.titleView.mas_top).offset(0);
        make.left.mas_equalTo(self.navigationItem.titleView.mas_left).offset(0);
        make.right.mas_equalTo(self.navigationItem.titleView.mas_right).offset(0);
        make.bottom.mas_equalTo(self.navigationItem.titleView.mas_bottom).offset(0);
    }];
}

- (void)searchClickChange:(PublicTextfield  *)changes{
    NSArray *hotSeaches = @[@"买房·租房", @"装修·日杂", @"汽车·交易", @"美食·外卖", @"家居·建材", @"家教·国学", @"超市·外卖", @"丽人·美妆", @"农副·土特产", @"娱乐·休闲"];
    // 2. 创建搜索控制器
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"请输入您想搜索产品的关键词" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        [searchViewController.navigationController pushViewController:[[SearchResultViewController alloc] init] animated:YES];
    }];
    searchViewController.hotSearchStyle = PYHotSearchStyleColorfulTag;//设置热门搜索为彩色标签风格
    searchViewController.searchHistoryStyle = PYSearchHistoryStyleBorderTag;//设置搜索历史为带边框标签风格
    searchViewController.searchTextField.font=[UIFont systemFontOfSize:13.0];
    searchViewController.delegate = self;
    // 3. 跳转到搜索控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav  animated:NO completion:nil];
}

//搜索代理
#pragma mark - pysearch搜索联想代理
- (void)searchViewController:(PYSearchViewController *)searchViewController searchTextDidChange:(UISearchBar *)seachBar searchText:(NSString *)searchText
{
    if (searchText.length) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSMutableArray *searchSuggestionsM = [NSMutableArray array];
            for (int i = 0; i < arc4random_uniform(5) + 10; i++) {
                NSString *searchSuggestion = [NSString stringWithFormat:@"Search suggestion %d", i];
                [searchSuggestionsM addObject:searchSuggestion];
            }
            searchViewController.searchSuggestions = searchSuggestionsM;
        });
    }
}

#pragma mark - 城市选择
- (void)selectCityDown{
    _leftButton=[PublicButton buttonWithFrame:CGRectMake(0, 0, 40, 33) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"下拉-2" backgroundImageImage:@"" title:@"城市选择" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:nil target:self action:@selector(leftBarClick)];
    UIBarButtonItem  *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_leftButton];
    self.navigationItem.leftBarButtonItem=leftBarButtonItem;
}

- (void)leftBarClick{
    NSLog(@"左侧地址选择");
    [self presentViewController:[[YMCitySelect alloc] initWithDelegate:self] animated:YES completion:nil];
}
//商家平台
- (void)businessPlatform{
    _rightButton=[PublicButton buttonWithFrame:CGRectMake(0, 0, 40, 33) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"" backgroundImageImage:@"" title:@"商家平台" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:nil target:self action:@selector(rightBarClick)];
    UIBarButtonItem  *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem=rightBarButtonItem;
}

- (void)rightBarClick{
    BusinessPlatformViewController *businessPlatform = [[BusinessPlatformViewController alloc]init];
    [self.navigationController pushViewController:businessPlatform animated:YES];
}

- (void)ym_ymCitySelectCityName:(NSString *)cityName{
    [_leftButton setTitle:cityName forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionView *)collectionView{
//    __weak typeof(self) weakself = self;
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[GoodsClassificationCell class] forCellWithReuseIdentifier:goodsClassificationCell];
        [_collectionView registerClass:[GoodsClassificationHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:goodsClassificationHeaderView];
        [_collectionView registerClass:[ShopsActivityCell class] forCellWithReuseIdentifier:shopsActivityCell];
        [_collectionView registerClass:[SelectedActivitiesCell class] forCellWithReuseIdentifier:selectedActivitiesCell];
        [_collectionView registerClass:[SelectedActivitiesHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:selectedActivitiesHeaderView];
        self.collectionView.mj_header = [CustemInfoHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 结束刷新
                [self.collectionView.mj_header endRefreshing];
            });
        }];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 7;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.goodsClassficationArray.count;
    }else{
        return 1;
    }
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *goodsCell = nil;
    if (indexPath.section == 0) {  //分类选项
        GoodsClassificationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:goodsClassificationCell forIndexPath:indexPath];
        cell.goodsClassModel = self.goodsClassficationArray[indexPath.row];
        goodsCell = cell;
    }else if (indexPath.section == 1){  //商品推荐
        ShopsActivityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shopsActivityCell forIndexPath:indexPath];
        goodsCell = cell;
    }else{  // 精选活动
        SelectedActivitiesCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:selectedActivitiesCell forIndexPath:indexPath];
        goodsCell = cell;
    }
    return goodsCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(KScreenWidth/5, KScreenWidth/5+20);
    }else if(indexPath.section == 1){
        return CGSizeMake(KScreenWidth, 242);
    }else{
        return CGSizeMake(KScreenWidth, 150);
    }
    return CGSizeZero;
}
// y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
// x间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

#pragma mark -collection点击事件

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击的是第%ld个",(long)indexPath.row);
    if (indexPath.row == 0) { //家居建材
        HomeFurnishingViewController *homeFurnishing = [[HomeFurnishingViewController alloc]init];
        [self.navigationController pushViewController:homeFurnishing animated:YES];
    }else if (indexPath.row ==1){ //买房租房
        BuyHouseViewController *buyHouseView = [[BuyHouseViewController alloc]init];
        [self.navigationController pushViewController:buyHouseView animated:YES];
    }else if (indexPath.row ==2){ //装修日杂
        DecoratingMiscellaneousViewController *decoratingMiscellaneous = [[DecoratingMiscellaneousViewController alloc]init];
        [self.navigationController pushViewController:decoratingMiscellaneous animated:YES];
    }else if (indexPath.row == 3){ //汽车交易
        AutomobileTradeViewController *automobileTrade=[[AutomobileTradeViewController alloc]init];
        [self.navigationController pushViewController:automobileTrade animated:YES];
    }else if (indexPath.row == 4){ //超市外卖
        SupermarketViewController *supermarketView = [[SupermarketViewController alloc]init];
        [self.navigationController pushViewController:supermarketView animated:YES];
    }else if (indexPath.row == 5){ //美食外卖
        GourmetTakeoutViewController *gourmetTakeout = [[GourmetTakeoutViewController alloc]init];
        [self.navigationController pushViewController:gourmetTakeout animated:YES];
    }else if (indexPath.row == 6){ //家教国学
        FamilyEducationViewController *familyEducation = [[FamilyEducationViewController alloc]init];
        [self.navigationController pushViewController:familyEducation animated:YES];
    }else if (indexPath.row == 7){ //丽人美妆
        BeautyBeautyViewController *beautyBeauty = [[BeautyBeautyViewController alloc]init];
        [self.navigationController pushViewController:beautyBeauty animated:YES];
    }else if (indexPath.row == 8){ //农副产品
        AgriculturalViewController *agricultural = [[AgriculturalViewController alloc]init];
        [self.navigationController pushViewController:agricultural animated:YES];
    }else if (indexPath.row == 9){
        EntertainmentViewController *entertainment = [[EntertainmentViewController alloc]init];
        [self.navigationController pushViewController:entertainment animated:YES];
    }
}

//加载数据
- (void)reloadUpdata{
    NSArray *dataArray = @[@{@"iconImage":@"家具",@"gridTitle":@"家居·建材"},
                          @{@"iconImage":@"租房",@"gridTitle":@"买房·租房"},
                          @{@"iconImage":@"装修",@"gridTitle":@"装修·日杂"},
                          @{@"iconImage":@"汽车",@"gridTitle":@"汽车·交易"},
                          @{@"iconImage":@"超市",@"gridTitle":@"超市·外卖"},
                          @{@"iconImage":@"美食",@"gridTitle":@"美食·外卖"},
                          @{@"iconImage":@"国学",@"gridTitle":@"家教·国学"},
                          @{@"iconImage":@"美妆",@"gridTitle":@"丽人·美妆"},
                          @{@"iconImage":@"农副",@"gridTitle":@"农副·土特产"},
                          @{@"iconImage":@"娱乐",@"gridTitle":@"休闲·娱乐"},
                          ];
    self.goodsClassficationArray = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *dict in dataArray) {
        [self.goodsClassficationArray addObject:[GoodsClassificationModel initWithDict:dict]];
    }
}

//加载数据头部
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
        if (kind ==UICollectionElementKindSectionHeader) {
            if (indexPath.section == 0) {
                GoodsClassificationHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:goodsClassificationHeaderView forIndexPath:indexPath];
                headerView.bannerArray = self.bannerArray;
                NSLog(@"%@",self.bannerArray);
                headerView.indexShow = ^(NSInteger index) {
                    NewActivitiesViewController *newActivities = [[NewActivitiesViewController alloc]init];
                    [self.navigationController pushViewController:newActivities animated:YES];
                };
                reusableview = headerView;
            }
            else if(indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 5 || indexPath.section == 6){
                SelectedActivitiesHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:selectedActivitiesHeaderView forIndexPath:indexPath];
                reusableview = headerView;
                if (self.imgArrays.count > 0) {
                    headerView.imgView.image = [UIImage imageNamed:self.imgArrays[indexPath.section-2]];
                }
            }
        }
        return reusableview;
}

//header宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(KScreenWidth, 200);
    }else if(section == 1){
        return CGSizeMake(KScreenWidth, 0);
    }else{
        return CGSizeMake(KScreenWidth, 180);
    }
}

@end
