//
//  ShopHomePageViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/3.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ShopHomePageViewController.h"
#import "SearchResultViewController.h"
#import "HomeFurnishingShowChildViewController.h"
#import "CommercialStorefrontViewController.h"

@interface ShopHomePageViewController ()<PYSearchViewControllerDelegate,ZJScrollPageViewDelegate>
@property(nonatomic,strong)NSArray<NSString *> *titles;
@property(nonatomic,strong)ZJScrollPageView *scrollPageView;
@property(strong, nonatomic)NSArray<UIViewController *> *childVcs;

@end

@implementation ShopHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    self.title = @"商家主页";
    [self reloadNavigationContentView];
    [self reloadScrollviewSegment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建导航栏顶部搜索框
- (void)reloadNavigationContentView{
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

#pragma mark - 创建头部滚动条
- (void)reloadScrollviewSegment{
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    style.showLine = YES;//显示滚动条
    style.gradualChangeTitleColor = YES;// 颜色渐变
    style.autoAdjustTitlesWidth=YES;
    style.adjustCoverOrLineWidth=YES;
    self.titles = @[@"综合",
                    @"销量",
                    @"价格",
                    @"新品",
                    ];
    _scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, KScreenWidth, KScreenHeight - 64.0) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    [self.view addSubview:_scrollPageView];
    
}
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    
    if (!childVc) {
        childVc = [[CommercialStorefrontViewController alloc] init];
    }
    return childVc;
}


- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
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

@end
