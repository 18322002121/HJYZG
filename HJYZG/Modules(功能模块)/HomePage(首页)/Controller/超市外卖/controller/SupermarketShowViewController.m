//
//  SupermarketShowViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/8.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SupermarketShowViewController.h"
#import "SupermarketShowCell.h"
#import "SupermarketDetailsViewController.h"

@interface SupermarketShowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;
@end
static NSString *const supermarketShowCell = @"SupermarketShowCell";
@implementation SupermarketShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品展示";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self reloadHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kTopHeight+40, KScreenWidth, KScreenHeight-kTopHeight-40) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[SupermarketShowCell class] forCellWithReuseIdentifier:supermarketShowCell];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SupermarketShowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:supermarketShowCell forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KScreenWidth-2)/2, 240);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SupermarketDetailsViewController *supermarketDetails = [[SupermarketDetailsViewController alloc]init];
    [self.navigationController pushViewController:supermarketDetails animated:YES];
}

- (void)reloadHeaderView{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, kTopHeight, KScreenWidth, 40)];
    headerView.backgroundColor = KWhiteColor;
    [self.view addSubview:headerView];
    
    PublicButton *comprehensiveButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"下拉-2" backgroundImageImage:@"" title:@"综合" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(allClickReload:)];
    comprehensiveButton.tag = 001;
    
    PublicButton *salesVolumeButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"下拉-2" backgroundImageImage:@"" title:@"销量" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(allClickReload:)];
    salesVolumeButton.tag = 002;
    
    PublicButton *priceButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"下拉-2" backgroundImageImage:@"" title:@"价格" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(allClickReload:)];
    priceButton.tag = 003;
    
    PublicButton *newProductButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"下拉-2" backgroundImageImage:@"" title:@"新品" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:headerView target:self action:@selector(allClickReload:)];
    newProductButton.tag = 004;
    
    [@[comprehensiveButton,salesVolumeButton,priceButton,newProductButton] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:0 tailSpacing:0];
    
    [@[comprehensiveButton,salesVolumeButton,priceButton,newProductButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(headerView.mas_centerY).offset(0);
        make.height.mas_equalTo(40);
    }];
 
}

- (void)allClickReload:(UIButton *)sender{
    
    if (sender.tag == 001) {
        NSLog(@"点击001");
    }else if (sender.tag == 002){
        NSLog(@"点击002");
    }else if (sender.tag == 003){
        NSLog(@"点击003");
    }else if (sender.tag == 004){
        NSLog(@"点击004");
    }
}


@end
