//
//  GourmetTakeoutViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GourmetTakeoutViewController.h"
#import "GourmetTakeoutRecommendCell.h" //美食推荐
#import "GourmetTakeoutAllCell.h" //全部
#import "GourmetTakeoutCell.h"
#import "GourmetTakeoutClassificationCell.h"
#import "GourmetTakeoutHeaderView.h"
#import "GourmetTakeoutBusinessShopViewController.h"
#import "BusinessListViewController.h" //商家列表
#import "FoodRecommendationViewController.h"
#import "GourmetTakeoutHeaderViewNormal.h"

@interface GourmetTakeoutViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PYSearchViewControllerDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;
/** 购物车 */
@property (nonatomic,strong) PublicButton *shoppingCart;
@end

static NSString *const gourmetTakeoutCell = @"GourmetTakeoutCell";
static NSString *const gourmetTakeoutRecommendCell = @"GourmetTakeoutRecommendCell";
static NSString *const gourmetTakeoutAllCell = @"GourmetTakeoutAllCell";
static NSString *const gourmetTakeoutClassificationCell = @"GourmetTakeoutClassificationCell";
static  NSString *const gourmetTakeoutHeaderView = @"GourmetTakeoutHeaderView";
static NSString *const gourmetTakeoutHeaderViewNormal = @"GourmetTakeoutHeaderViewNormal";

@implementation GourmetTakeoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"美食外卖";
    [self addNavigationToTextfield];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    _shoppingCart = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"gouwuche" backgroundImageImage:@"" title:@"" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:self.view target:self action:@selector(shoppingCartClick)];
    [_shoppingCart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-20);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[GourmetTakeoutCell class] forCellWithReuseIdentifier:gourmetTakeoutCell];
        [_collectionView registerClass:[GourmetTakeoutRecommendCell class] forCellWithReuseIdentifier:gourmetTakeoutRecommendCell];
        [_collectionView registerClass:[GourmetTakeoutAllCell class] forCellWithReuseIdentifier:gourmetTakeoutAllCell];
        [_collectionView registerClass:[GourmetTakeoutClassificationCell class] forCellWithReuseIdentifier:gourmetTakeoutClassificationCell];
        [_collectionView registerClass:[GourmetTakeoutHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:gourmetTakeoutHeaderView];
        [_collectionView registerClass:[GourmetTakeoutHeaderViewNormal class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:gourmetTakeoutHeaderViewNormal];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if  (section == 0 ){
        return 2;
    }else if (section == 2 || section == 1) {
        return 1;

    }else{
        return 5;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *gourmetCell =nil;
    if (indexPath.section == 0) {
        GourmetTakeoutRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:gourmetTakeoutRecommendCell forIndexPath:indexPath];
        cell.didSelectItemClickButton = ^(NSIndexPath *indexPath) {
            FoodRecommendationViewController *foodRecommendation = [[FoodRecommendationViewController alloc]init];
            [self.navigationController pushViewController:foodRecommendation animated:YES];
        };
        gourmetCell = cell;
    }else if (indexPath.section == 1){
        GourmetTakeoutClassificationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:gourmetTakeoutClassificationCell forIndexPath:indexPath];
        cell.businessListIndexPath = ^(NSIndexPath *indexPath) {
            BusinessListViewController *businessListView = [[BusinessListViewController alloc]init];
            [self.navigationController pushViewController:businessListView animated:YES];
        };
        gourmetCell = cell;
    }else if (indexPath.section == 2){
        GourmetTakeoutAllCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:gourmetTakeoutAllCell forIndexPath:indexPath];
        gourmetCell = cell;
    }else if (indexPath.section == 3){
        GourmetTakeoutCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:gourmetTakeoutCell forIndexPath:indexPath];
        gourmetCell = cell;
    }
    return gourmetCell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(KScreenWidth, 170);
    }else if (indexPath.section == 1){
        return CGSizeMake(KScreenWidth, 200);
    }else if (indexPath.section == 2){
        return CGSizeMake(KScreenWidth, 100);
    }else{
        return CGSizeMake(KScreenWidth, 150);
    }
    
}

//加入购物车
- (void)shoppingCartClick{
    NSLog(@"加入购物车");
}

//添加导航输入框
- (void)addNavigationToTextfield{
    PublicTextfield *searchTextfield=[PublicTextfield textFieldWithFrame:CGRectMake(0, 0, 0, 0) background:[UIImage imageNamed:@""] secureTextEntry:NO placeholder:@"请输入您想搜索产品的关键词" clearsOnBeginEditing:YES];
    searchTextfield.font=[UIFont systemFontOfSize:13.0];
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
        [searchViewController.navigationController pushViewController:[[UIViewController alloc] init] animated:YES];
    }];
    searchViewController.hotSearchStyle = PYHotSearchStyleColorfulTag;//设置热门搜索为彩色标签风格
    searchViewController.searchHistoryStyle = PYSearchHistoryStyleBorderTag;//设置搜索历史为带边框标签风格
    searchViewController.searchTextField.font=[UIFont systemFontOfSize:13.0];
    searchViewController.delegate = self;
    // 3. 跳转到搜索控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav  animated:NO completion:nil];
}

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

//加载数据头部
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if (kind ==UICollectionElementKindSectionHeader) {
        
        if (indexPath.section == 0 ) {
            GourmetTakeoutHeaderViewNormal *headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:gourmetTakeoutHeaderViewNormal forIndexPath:indexPath];
            reusableview = headerView;
        }else if (indexPath.section == 2){
            GourmetTakeoutHeaderViewNormal *headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:gourmetTakeoutHeaderViewNormal forIndexPath:indexPath];
            reusableview = headerView;
        }
        if (indexPath.section == 3) {
            GourmetTakeoutHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:gourmetTakeoutHeaderView forIndexPath:indexPath];
            [self reloadGourmetTakeoutHeaderView:headerView];
            reusableview = headerView;
        }
        
    }
    return reusableview;
}

//header宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0 || section ==2) {
        return CGSizeMake(KScreenWidth, 40);
    }else if (section == 3){
        return CGSizeMake(KScreenWidth, 70);
    }else{
        return CGSizeMake(KScreenWidth, 0);
    }
}

- (void)reloadGourmetTakeoutHeaderView:(GourmetTakeoutHeaderView *)headerView{
    headerView.reloadButton = ^(UIButton *sender) {
        GourmetTakeoutBusinessShopViewController *gourmetTakeoutBusinessShop = [[GourmetTakeoutBusinessShopViewController alloc]init];
        [self.navigationController pushViewController:gourmetTakeoutBusinessShop animated:YES];
    };
}


@end
