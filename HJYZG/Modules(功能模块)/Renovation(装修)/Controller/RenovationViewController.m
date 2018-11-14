//
//  RenovationViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/7.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "RenovationViewController.h"
#import "MortgageCalculationViewController.h"
#import "MortgageCalculationShowViewController.h"
#import "HomeFurnishingShowModel.h"
#import "PublicWaterFallLayout.h"
#import "HomeFurnishingShowCell.h"
#import "RenovationCell.h"
#import "SelectedActivitiesModel.h"
#import "PanoramaViewController.h"

@interface RenovationViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView * collectionView;
@property(nonatomic,strong)NSArray *datasArray;
@property(nonatomic,strong)NSArray *titles;
@property(nonatomic,strong)ZJScrollPageView *scrollPageView;
@property(strong, nonatomic)NSArray<UIViewController *> *childVcs;
@property(nonatomic,strong)PublicButton *leftButton;
@property(nonatomic,strong)PublicButton *rightButton;
@property (nonatomic,strong) YQPanoramaView *panaromview;
@property (nonatomic,strong) NSMutableArray *dataArrays;
@end
static NSString *const renovationCell = @"RenovationCell";
@implementation RenovationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"附近商家";
    [self reloadHeaderView];
    [self reloadData];
    [self reloadLeftBarAndRightBar];
}

- (void)reloadLeftBarAndRightBar{
    _leftButton=[PublicButton buttonWithFrame:CGRectMake(0, 0, 80, 40) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"下拉-2" backgroundImageImage:@"" title:@"房贷计算器" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:nil target:self action:@selector(fangdaiClick)];
    UIBarButtonItem  *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_leftButton];
    self.navigationItem.leftBarButtonItem=leftBarButtonItem;
    
    _rightButton=[PublicButton buttonWithFrame:CGRectMake(0, 0, 80, 40) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"下拉-2" backgroundImageImage:@"" title:@"VR体验区" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:nil target:self action:@selector(vrClick)];
    UIBarButtonItem  *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem=rightBarButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)fangdaiClick{
    MortgageCalculationViewController *mortgageCalculation=[[MortgageCalculationViewController alloc]init];
    [self.navigationController pushViewController:mortgageCalculation animated:YES];
    
}

- (void)vrClick{
    //初始化
    self.panaromview = [[YQPanoramaView alloc]initWithFrame:CGRectMake(20, 20, self.view.frame.size.width-40, self.view.frame.size.height-80)];
    
    //设图片
    self.panaromview.image = [UIImage imageNamed:@"WechatIMG67.jpeg"];
    
    //显示
    [self.view addSubview:self.panaromview];
    self.panaromview.Fisheye = YES;
}

//条件筛选下拉框view
- (void)reloadHeaderView{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, kTopHeight, KScreenWidth, 40)];
    headerView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
    [self.view addSubview:headerView];
    
    PublicButton *huxingButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"下拉" backgroundImageImage:@"" title:@"户型" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(huxingClick:)];
    
    PublicButton *styleButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"下拉" backgroundImageImage:@"" title:@"风格" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(styleClick:)];
    
    PublicButton *areaButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"下拉" backgroundImageImage:@"" title:@"面积" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(areaClick:)];
    
    [@[huxingButton,styleButton,areaButton] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:0 tailSpacing:0];
    
    [@[huxingButton,styleButton,areaButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(headerView.mas_centerY).offset(0);
        make.height.mas_equalTo(40);
    }];
}
//户型
- (void)huxingClick:(UIButton *)sender{
    [BRStringPickerView showStringPickerWithTitle:@"户型" dataSource:@[@"不限", @"小户型", @"一居", @"二居", @"三居", @"四居", @"复式", @"别墅", @"公寓"] defaultSelValue:@"不限" resultBlock:^(id selectValue) {
        [sender setTitle:selectValue forState:UIControlStateNormal];
    }];
}
//风格
- (void)styleClick:(UIButton *)sender{
    [BRStringPickerView showStringPickerWithTitle:@"风格" dataSource:@[@"不限", @"简约", @"现代", @"中式", @"欧式", @"美式", @"田园", @"新古典", @"混搭", @"地中海", @"东南亚", @"日式", @"宜家", @"北欧", @"简欧"] defaultSelValue:@"不限" resultBlock:^(id selectValue) {
        [sender setTitle:selectValue forState:UIControlStateNormal];
    }];
}
//面积
- (void)areaClick:(UIButton *)sender{
    [BRStringPickerView showStringPickerWithTitle:@"面积" dataSource:@[@"不限", @"60m²以下", @"60～80m²", @"80～100m²", @"100～120m²", @"120～150m²", @"150m²以上"] defaultSelValue:@"不限" resultBlock:^(id selectValue) {
        [sender setTitle:selectValue forState:UIControlStateNormal];
    }];
}


#pragma mark - 创建 collection

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kTopHeight + 40, KScreenWidth, KScreenHeight - 40 -kTopHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[RenovationCell class] forCellWithReuseIdentifier:renovationCell];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RenovationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:renovationCell forIndexPath:indexPath];
    cell.selectedActivitie = self.dataArrays[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KScreenWidth-20)/2, 170);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

//加载数据
- (void)reloadData{
    NSArray *dataArray = @[@{@"image_url":@"jiaju1.jpeg",@"nature":@"北欧"},
                           @{@"image_url":@"jiaju2.jpeg",@"nature":@"现代简约"},
                           @{@"image_url":@"jiaju3.jpeg",@"nature":@"欧式"},
                           @{@"image_url":@"jiaju4.jpeg",@"nature":@"新中式"},
                           @{@"image_url":@"jiaju5.jpeg",@"nature":@"美式"},
                           @{@"image_url":@"jiaju6.jpeg",@"nature":@"田园风光"},
                           @{@"image_url":@"jiaju7.jpeg",@"nature":@"东南亚"},
                           @{@"image_url":@"jiaju8.jpeg",@"nature":@"日式"},
                           @{@"image_url":@"jiaju9.jpeg",@"nature":@"美式乡村"},
                           @{@"image_url":@"jiaju10.jpeg",@"nature":@"地中海"},
                           ];
    _dataArrays = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *dict in dataArray) {
        [self.dataArrays addObject:[[SelectedActivitiesModel alloc]initWithDictionary:dict]];
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(8, 8, 8, 8);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld个item",indexPath.row);
    PanoramaViewController *panoramaView = [[PanoramaViewController alloc]init];
    [self.navigationController pushViewController:panoramaView animated:YES];
}

@end
