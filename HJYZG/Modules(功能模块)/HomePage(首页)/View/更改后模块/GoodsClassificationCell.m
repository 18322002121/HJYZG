//
//  GoodsClassificationCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GoodsClassificationCell.h"
#import "GoodsClassificationModel.h"

@interface GoodsClassificationCell ()
@property (nonatomic,strong) UIImageView *goodsimagesView;
@property (nonatomic,strong) UILabel *goodsTitle;
@end

@implementation GoodsClassificationCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _goodsimagesView = [[UIImageView alloc]init];
        _goodsimagesView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_goodsimagesView];
        
        _goodsTitle = [[UILabel alloc]init];
        _goodsTitle.font = [UIFont systemFontOfSize:11.0];
        _goodsTitle.textAlignment =NSTextAlignmentCenter;
        [self addSubview:_goodsTitle];
        
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_goodsimagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(45, 45));
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
    }];
    
    [_goodsTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self.goodsimagesView.mas_bottom)setOffset:5];
    }];
}

- (void)setGoodsClassModel:(GoodsClassificationModel *)goodsClassModel{
    _goodsClassModel = goodsClassModel;
    _goodsTitle.text = goodsClassModel.gridTitle;
    _goodsimagesView.image =[UIImage imageNamed:goodsClassModel.iconImage];
}

@end
