//
//  SupermarketCategoryCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SupermarketCategoryCell.h"
#import "SupermarketModel.h"
@interface SupermarketCategoryCell ()
@property (nonatomic,strong) UIImageView *goodsImageView;
@property (nonatomic,strong) UILabel *goodsTitleLabel;
@end
@implementation SupermarketCategoryCell

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

- (void)setSupermarketSideGoods:(SupermarketSideGoods *)supermarketSideGoods{
    _supermarketSideGoods = supermarketSideGoods;
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:supermarketSideGoods.image_url] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    _goodsTitleLabel.text = supermarketSideGoods.goods_title;
}


@end
