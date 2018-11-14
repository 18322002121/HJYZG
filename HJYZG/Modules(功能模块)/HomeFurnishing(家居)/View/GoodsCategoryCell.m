//
//  GoodsCategoryCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/16.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GoodsCategoryCell.h"
#import "MainSideTitleModel.h"
@interface GoodsCategoryCell ()
@property (nonatomic,strong) UIImageView *goodsImageView;
@property (nonatomic,strong) UILabel *goodsTitleLabel;
@end
@implementation GoodsCategoryCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor colorWithRed:0.91 green:0.89 blue:0.89 alpha:1.00].CGColor;
        
        _goodsImageView = [[UIImageView  alloc]init];
        [self addSubview:_goodsImageView];
        
        _goodsTitleLabel = [[UILabel alloc]init];
        _goodsTitleLabel.font=[UIFont systemFontOfSize:13.0];
        _goodsTitleLabel.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_goodsTitleLabel];
    }
    return self;
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self)setOffset:5];
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width * 0.85, self.frame.size.width * 0.85));
    }];
    
    [self.goodsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.goodsImageView.mas_bottom)setOffset:5];
        make.width.mas_equalTo(self.goodsImageView);
        make.centerX.mas_equalTo(self);
    }];
    
}


- (void)setMainGoodsModel:(MainSideGoods *)mainGoodsModel{
    _mainGoodsModel = mainGoodsModel;
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:mainGoodsModel.image_url] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    _goodsTitleLabel.text = mainGoodsModel.goods_title;
}


@end
