//
//  SelectedActivitiesChildCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/19.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SelectedActivitiesChildCell.h"
#import "SelectedActivitiesModel.h"

@interface SelectedActivitiesChildCell ()
/* 图片 */
@property (strong , nonatomic)UIImageView *goodsImageView;
/* 价格 */
@property (strong , nonatomic)UILabel *natureLabel;
/* 剩余 */
@property (strong , nonatomic)UILabel *stockLabel;
@end

@implementation SelectedActivitiesChildCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _goodsImageView = [[UIImageView alloc]init];
        [self addSubview:_goodsImageView];
        
        _natureLabel = [[UILabel alloc]init];
        _natureLabel.font = [UIFont systemFontOfSize:17.0];
        _natureLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_natureLabel];
        
        _stockLabel = [[UILabel alloc]init];
        _stockLabel.font = [UIFont systemFontOfSize:10.0];
        _stockLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_stockLabel];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.width.mas_equalTo(self).multipliedBy(0.8);
        make.height.mas_equalTo(self.frame.size.width * 0.8);
    }];
    
    [_natureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.goodsImageView.mas_bottom)setOffset:2];
        make.centerX.mas_equalTo(self);
    }];
    
    [_stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.natureLabel.mas_bottom)setOffset:2];
        make.centerX.mas_equalTo(self);
    }];
    
}

- (void)setActivitiesModel:(SelectedActivitiesModel *)activitiesModel{
    _activitiesModel = activitiesModel;
    _goodsImageView.image = [UIImage imageNamed:activitiesModel.image_url];
    _natureLabel.text = activitiesModel.nature;
    _stockLabel.text = activitiesModel.stock;
}


@end
