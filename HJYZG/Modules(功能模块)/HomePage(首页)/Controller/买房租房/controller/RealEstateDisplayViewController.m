//
//  RealEstateDisplayViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/12.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "RealEstateDisplayViewController.h"
#import "RealEstateDisplayCell.h"
#import "RealEstateDisplayHeaderView.h"

@interface RealEstateDisplayViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,JXCategoryViewDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;
@end

static NSString *const realEstateDisplayCell = @"RealEstateDisplayCell";
static NSString *const realEstateDisplayHeaderView = @"RealEstateDisplayHeaderView";
@implementation RealEstateDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"楼盘展示";
    [self navigationBottom];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigationBottom{
    UIView *navigationBottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kTopHeight, KScreenWidth, 40)];
    navigationBottomView.backgroundColor = KWhiteColor;
    JXCategoryTitleView *titlesView = [[JXCategoryTitleView alloc]initWithFrame:CGRectMake(0, 0, navigationBottomView.frame.size.width, 40)];
    titlesView.titleFont = [UIFont systemFontOfSize:13.0];
    titlesView.delegate = self;
    titlesView.titles = @[@"楼盘",@"沙盘",@"户型",@"周边配套",@"售楼处"];
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorLineViewColor = [UIColor redColor];
    lineView.indicatorLineWidth = JXCategoryViewAutomaticDimension;
    lineView.indicatorLineViewHeight = 2;
    titlesView.indicators = @[lineView];
    [navigationBottomView addSubview:titlesView];
    [self.view addSubview:navigationBottomView];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kTopHeight+40, KScreenWidth, KScreenHeight-kTopHeight-40) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[RealEstateDisplayCell class] forCellWithReuseIdentifier:realEstateDisplayCell];
        [_collectionView registerClass:[RealEstateDisplayHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:realEstateDisplayHeaderView];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RealEstateDisplayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:realEstateDisplayCell forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KScreenWidth-10)/3, 120);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        RealEstateDisplayHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:realEstateDisplayHeaderView forIndexPath:indexPath];
        reusableview = headerView;
    }
    return reusableview;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(KScreenWidth, 25);
}





@end
