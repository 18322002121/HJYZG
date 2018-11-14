//
//  SelectedActivitiesCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/19.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SelectedActivitiesCell.h"
#import "SelectedActivitiesChildCell.h"
#import "SelectedActivitiesModel.h"
#import "SelectedActivitiesShowViewController.h"

@interface SelectedActivitiesCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *dataArrays;

@end

static NSString *const selectedActivitiesChildCell = @"SelectedActivitiesChildCell";

@implementation SelectedActivitiesCell

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[SelectedActivitiesChildCell class] forCellWithReuseIdentifier:selectedActivitiesChildCell];
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.collectionView.backgroundColor = [UIColor whiteColor];
        //加载数据
        NSArray *dataArray = @[@{@"image_url":@"秋冬新品.jpg",@"nature":@"秋冬新品",@"stock":@"欧式磨毛大赏"},
                               @{@"image_url":@"优选芯枕.jpg",@"nature":@"优选芯枕",@"stock":@"澳洲进口被芯249起"},
                               @{@"image_url":@"品质套件.jpg",@"nature":@"品质套件",@"stock":@"套件限量199抢"},
                               @{@"image_url":@"创意家居.jpg",@"nature":@"创意家居",@"stock":@"进店领50元券"},
                               @{@"image_url":@"自营清仓.jpg",@"nature":@"自营清仓",@"stock":@"自营好货精选"},
                               @{@"image_url":@"高端精选.jpg",@"nature":@"高端精选",@"stock":@"澳洲棉 艺术生活"},
                               @{@"image_url":@"LOVO旗舰店.jpg",@"nature":@"LOVO旗舰店",@"stock":@"欧洲新锐设计"},
                               @{@"image_url":@"欧恋纳.jpg",@"nature":@"欧恋纳",@"stock":@"满599减100元"},
                               @{@"image_url":@"",@"nature":@"查看更多",@"stock":@""},
                               ];
        _dataArrays = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dict in dataArray) {
            [self.dataArrays addObject:[[SelectedActivitiesModel alloc]initWithDictionary:dict]];
        }
    
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArrays.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SelectedActivitiesChildCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:selectedActivitiesChildCell forIndexPath:indexPath];
    cell.activitiesModel = self.dataArrays[indexPath.row];
    return cell;
}

// y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
// 设置水平间隙
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击的是第%ld个",(long)indexPath.row);
    SelectedActivitiesShowViewController * selectedActivitiesShow = [[SelectedActivitiesShowViewController alloc]init];
    [[self currentViewController].navigationController pushViewController:selectedActivitiesShow animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 150);
}

//获取当前视图的控制器
- (UIViewController *)currentViewController{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
        } while (next != nil);
    return nil;
}




@end
