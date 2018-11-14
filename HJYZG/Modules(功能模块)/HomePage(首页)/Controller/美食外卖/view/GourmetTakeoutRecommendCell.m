//
//  GourmetTakeoutRecommendCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/5.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GourmetTakeoutRecommendCell.h"
#import "GourmetTakeoutRecommendChildCell.h"

@interface GourmetTakeoutRecommendCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

static NSString *const gourmetTakeoutRecommendChildCell = @"GourmetTakeoutRecommendChildCell";
@implementation GourmetTakeoutRecommendCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.collectionView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.95 alpha:1.00];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[GourmetTakeoutRecommendChildCell class] forCellWithReuseIdentifier:gourmetTakeoutRecommendChildCell];
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 60;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GourmetTakeoutRecommendChildCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:gourmetTakeoutRecommendChildCell forIndexPath:indexPath];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KScreenWidth)/3, self.frame.size.height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    !_didSelectItemClickButton ? : _didSelectItemClickButton(indexPath);
}

@end
