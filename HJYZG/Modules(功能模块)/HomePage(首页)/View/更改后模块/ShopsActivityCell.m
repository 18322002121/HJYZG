//
//  ShopsActivityCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/19.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ShopsActivityCell.h"
#import "ShopsActivityChildCell.h"

@interface ShopsActivityCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *imagesArray;
@end

static NSString *const shopsActivityChildCell = @"ShopsActivityChildCell";

@implementation ShopsActivityCell

- (NSArray *)imagesArray{
    if (!_imagesArray) {
        _imagesArray = [NSArray arrayWithObjects:@"zhongqiu1",@"zhongqiu2",@"zhongqiu3",@"zhongqiu4",@"zhongqiu5", nil];
    }
    return _imagesArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.collectionView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[ShopsActivityChildCell class] forCellWithReuseIdentifier:shopsActivityChildCell];
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ShopsActivityChildCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shopsActivityChildCell forIndexPath:indexPath];
    cell.imagesView.image = [UIImage imageNamed:self.imagesArray[indexPath.row]];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row ==0 || indexPath.row ==1) {
        return CGSizeMake((KScreenWidth-2)/2, 120);
    }else{
        return CGSizeMake((KScreenWidth-3)/3, 120);
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld个item",(long)indexPath.row);
}


@end
