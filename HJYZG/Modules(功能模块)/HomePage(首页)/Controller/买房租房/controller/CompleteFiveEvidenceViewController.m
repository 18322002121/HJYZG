//
//  CompleteFiveEvidenceViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "CompleteFiveEvidenceViewController.h"
#import "CompleteFiveEvidenceCell.h"

@interface CompleteFiveEvidenceViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *imgArr;
@end

static NSString  *const completeFiveEvidenceCell = @"CompleteFiveEvidenceCell";

@implementation CompleteFiveEvidenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"五证展示";
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CompleteFiveEvidenceCell class] forCellWithReuseIdentifier:completeFiveEvidenceCell];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CompleteFiveEvidenceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:completeFiveEvidenceCell forIndexPath:indexPath];
    _imgArr = [NSArray arrayWithObjects:@"jiaju1",@"jiaju2",@"jiaju3",@"jiaju4",@"jiaju5", nil];
    cell.imagesView.image = [UIImage imageNamed:_imgArr[indexPath.row]];
    cell.backgroundColor = kRandomColor;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KScreenWidth-2)/2, 240);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击无效果");
}






@end
