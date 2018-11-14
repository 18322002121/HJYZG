//
//  GoodsClassificationHeaderView.m
//  HJYZG
//
//  Created by HCY on 2018/9/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GoodsClassificationHeaderView.h"


@interface GoodsClassificationHeaderView ()<SDCycleScrollViewDelegate>
@property (nonatomic,strong) SDCycleScrollView *bannerImageView;
@end

@implementation GoodsClassificationHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _bannerImageView = [[SDCycleScrollView alloc]init];
        _bannerImageView.delegate = self;
        _bannerImageView.autoScrollTimeInterval = 5.0;
        [self addSubview:_bannerImageView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_bannerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
}


- (void)setBannerArray:(NSArray *)bannerArray{
    _bannerArray = bannerArray;
    _bannerImageView.imageURLStringsGroup = bannerArray;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"banner图点击事件");
    !_indexShow ? : _indexShow(index);
}

@end
