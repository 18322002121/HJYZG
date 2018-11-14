//
//  HomeFurnishingShowChildViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/25.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HomeFurnishingShowChildViewController.h"
#import "HomeFurnishingShowChildCell.h"
#import "HomeFurnishingShowChildLayout.h"
#import "HomeFurnishingShowModel.h"
#import "PublicWaterFallLayout.h"
#import "HomeFurnishingShowCell.h"
#import "CommodityDetailsViewController.h"
#import "ShopdetailsViewController.h"

@interface HomeFurnishingShowChildViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView * collectionView;
//@property(nonatomic,strong)NSArray *datasArray;
@property(nonatomic,strong)NSMutableArray *shopDataArray;
@end


static NSString *const homeFurnishingShowChildCell = @"HomeFurnishingShowChildCell";
@implementation HomeFurnishingShowChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        HomeFurnishingShowChildLayout *layout = [[HomeFurnishingShowChildLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-kNavBarHeight-64) collectionViewLayout:layout];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HomeFurnishingShowChildCell class] forCellWithReuseIdentifier:homeFurnishingShowChildCell];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.shopDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeFurnishingShowChildCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeFurnishingShowChildCell forIndexPath:indexPath];
    cell.furnishingShowModel = self.shopDataArray[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((KScreenWidth - 4)/2, (KScreenWidth - 4)/2 + 60);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 4;
    
}
#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 4;
}

//加载数据
- (void)reloadData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"ClasiftyGoods" ofType:@"plist"];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"%@",dataArray);
    _shopDataArray = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *dict in dataArray) {
        [self.shopDataArray addObject:[HomeFurnishingShowModel initWithDictionary:dict]];
    }
    NSLog(@"%lu",(unsigned long)self.shopDataArray.count);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShopdetailsViewController *shopdetails = [[ShopdetailsViewController alloc]init];
    [self.navigationController pushViewController:shopdetails animated:YES];
}

@end
