//
//  SupermarketViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SupermarketViewController.h"
#import "SupermarketLeftCell.h"
#import "SupermarketCategoryCell.h"
#import "SupermarketHeaderView.h"
#import "SupermarketModel.h"
#import "SupermarketLeftModel.h"
#import "SupermarketShowViewController.h"

@interface SupermarketViewController ()<PYSearchViewControllerDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray<SupermarketLeftModel *> *supermarketLeftArray;
@property (nonatomic,strong) NSMutableArray<SupermarketModel *> *supermarketModelArray;
@end
static NSString *const supermarketLeftCell = @"SupermarketLeftCell";
static NSString *const supermarketCategoryCell = @"SupermarketCategoryCell";
static NSString *const supermarketHeaderView = @"SupermarketHeaderView";
@implementation SupermarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    [self addNavigationToTextfield];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 添加搜索栏
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

#pragma mark - 创建左侧栏tableview
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 95, KScreenHeight) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[SupermarketLeftCell class] forCellReuseIdentifier:supermarketLeftCell];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 3; //X
        layout.minimumLineSpacing = 5;  //Y
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(96, 0, KScreenWidth-96, KScreenHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical=YES;//数据少也能正常滚动
        [_collectionView registerClass:[SupermarketCategoryCell class] forCellWithReuseIdentifier:supermarketCategoryCell];
        [_collectionView registerClass:[SupermarketHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:supermarketHeaderView];
        [self.view addSubview:_collectionView];  
    }
    return _collectionView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.supermarketLeftArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SupermarketLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:supermarketLeftCell];
    cell.titleModel = self.supermarketLeftArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击事件");
    NSString *path = [[NSBundle mainBundle]pathForResource:self.supermarketLeftArray[indexPath.row].fileName ofType:nil];
    NSArray *dataArray =[NSArray arrayWithContentsOfFile:path];
    [self.supermarketModelArray removeAllObjects];
    for (NSDictionary *dict in dataArray) {
        SupermarketModel *model = [SupermarketModel yy_modelWithDictionary:dict];
        [self.supermarketModelArray addObject:model];
    }
    [self.collectionView reloadData];
}

//UICollectionView代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.supermarketModelArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.supermarketModelArray[section].goods.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SupermarketCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:supermarketCategoryCell forIndexPath:indexPath];
    cell.supermarketSideGoods = self.supermarketModelArray[indexPath.section].goods[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(KScreenWidth, 25);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeZero;
}
//点击item跳转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了个第%zd分组第%zd几个Item",indexPath.section,indexPath.row);
    SupermarketShowViewController *supermarketShow = [[SupermarketShowViewController alloc]init];
    [self.navigationController pushViewController:supermarketShow animated:YES];
}

//头部view
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        
        SupermarketHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:supermarketHeaderView forIndexPath:indexPath];
        headerView.headerTitleModel = self.supermarketModelArray[indexPath.section];
        reusableview = headerView;
    }
    return reusableview;
}

//item宽高设置
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KScreenWidth-100-6-10)/3, (KScreenWidth - 100 - 6 - 10)/3 + 20);
}

#pragma mark - 加载数据,转换成模型数组

- (void)reloadData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"ClassifyTitles" ofType:@"plist"];
    NSArray *dataArray =[NSArray arrayWithContentsOfFile:path];
    _supermarketLeftArray = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *dict in dataArray) {
        [self.supermarketLeftArray addObject:[SupermarketLeftModel initWithDictionary:dict]];
    }
    NSString *mainPath = [[NSBundle mainBundle]pathForResource:@"ClassiftyGoods01" ofType:@"plist"];
    NSArray *mainDataArray =[NSArray arrayWithContentsOfFile:mainPath];
    _supermarketModelArray = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *dict in mainDataArray) {
        SupermarketModel *model = [SupermarketModel yy_modelWithDictionary:dict];
        [self.supermarketModelArray addObject:model];
    }
    NSLog(@"%@",mainDataArray);
    [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
}

@end
