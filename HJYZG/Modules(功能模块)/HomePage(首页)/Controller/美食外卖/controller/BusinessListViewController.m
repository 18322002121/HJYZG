//
//  BusinessListViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/7.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "BusinessListViewController.h"
#import "SearchResultViewController.h"
#import "BusinessListCell.h"
#import "BusinessListDetailsViewController.h"

@interface BusinessListViewController ()<PYSearchViewControllerDelegate,UITableViewDelegate,UITableViewDataSource,LrdSuperMenuDataSource,LrdSuperMenuDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *classifyArray; //全部
@property (nonatomic,strong) NSArray *theWholeCityArray; //全城
@property (nonatomic,strong) NSArray *intelligentSortingArray; //智能排序
@property (nonatomic,strong) NSArray *screenArray; //筛选
@property (nonatomic, strong) LrdSuperMenu *menu;
@end

static NSString *const businessListCell = @"BusinessListCell";

@implementation BusinessListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商家列表";
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self addNavigationToTextfield];
    [self reloadTopHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//添加导航输入框
- (void)addNavigationToTextfield{
    PublicTextfield *searchTextfield=[PublicTextfield textFieldWithFrame:CGRectMake(0, 0, 0, 0) background:[UIImage imageNamed:@""] secureTextEntry:NO placeholder:@"输入商家名、品类或商圈" clearsOnBeginEditing:YES];
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

//加载导航栏下面固定view
- (void)reloadTopHeaderView{
    
    self.classifyArray = @[@"全部", @"新店特惠", @"连锁餐厅", @"家常快餐", @"地方菜", @"特色小吃", @"日韩料理", @"西式快餐", @"烧烤海鲜"];
    self.theWholeCityArray = @[@"全城", @"华龙区", @"高新区", @"濮阳县", @"清丰县", @"南乐县", @"台前县", @"范县", @"滑县"];
    self.intelligentSortingArray = @[@"排序", @"智能排序", @"销量最高", @"距离最近", @"评分最高", @"起送价最低", @"送餐速度最快"];
    self.screenArray = @[@"筛选", @"立减优惠", @"预定优惠", @"特价优惠", @"折扣商品", @"进店领券", @"下单返券"];
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

#pragma mark - 创建tableview
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight+40, KScreenWidth, KScreenHeight-kTopHeight-40) style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[BusinessListCell class] forCellReuseIdentifier:businessListCell];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BusinessListCell *cell = [tableView dequeueReusableCellWithIdentifier:businessListCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BusinessListDetailsViewController *businessListDetails = [[BusinessListDetailsViewController alloc]init];
    [self.navigationController pushViewController:businessListDetails animated:YES];
}






@end
