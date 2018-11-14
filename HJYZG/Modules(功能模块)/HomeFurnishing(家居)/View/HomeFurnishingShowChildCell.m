//
//  HomeFurnishingShowChildCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/17.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HomeFurnishingShowChildCell.h"
#import "HomeFurnishingShowModel.h"
@interface HomeFurnishingShowChildCell ()
/* 优惠套装 */
@property (strong , nonatomic)UIImageView *freeSuitImageView;
/* 商品图片 */
@property (strong , nonatomic)UIImageView *gridImageView;
/* 商品标题 */
@property (strong , nonatomic)UILabel *gridLabel;
/* 自营 */
@property (strong , nonatomic)UIImageView *autotrophyImageView;
/* 价格 */
@property (strong , nonatomic)UILabel *priceLabel;
/* 评价数量 */
@property (strong , nonatomic)UILabel *commentNumLabel;

@end
@implementation HomeFurnishingShowChildCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.borderColor = [UIColor colorWithRed:0.91 green:0.89 blue:0.89 alpha:1.00].CGColor;
        self.layer.borderWidth = 0.5;
        
        _freeSuitImageView = [[UIImageView alloc] init];
        _freeSuitImageView.image = [UIImage imageNamed:@"taozhuang_tag"];
        [self addSubview:_freeSuitImageView];
        
        _autotrophyImageView = [[UIImageView alloc] init];
        [self addSubview:_autotrophyImageView];
        _autotrophyImageView.image = [UIImage imageNamed:@"detail_title_ziying_tag"];
        
        _gridImageView = [[UIImageView alloc] init];
        _gridImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_gridImageView];
        
        _gridLabel = [[UILabel alloc] init];
        _gridLabel.font = [UIFont systemFontOfSize:10.0];
        [self addSubview:_gridLabel];
        
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = [UIFont systemFontOfSize:13.0];
        _priceLabel.textColor = [UIColor redColor];
        [self addSubview:_priceLabel];
        
        _commentNumLabel = [[UILabel alloc] init];
        NSInteger pNum = arc4random() % 10000;
        _commentNumLabel.text = [NSString stringWithFormat:@"%zd人已评价",pNum];
        _commentNumLabel.font = [UIFont systemFontOfSize:10.0];
        _commentNumLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:_commentNumLabel];
        
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_gridImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self)setOffset:10];
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width * 0.8, self.frame.size.width * 0.8));
    }];
    
    [_autotrophyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self)setOffset:10];
        [make.top.mas_equalTo(self.gridImageView.mas_bottom)setOffset:10];
    }];
    
    [_gridLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.autotrophyImageView.mas_right).offset(2);
        make.centerY.mas_equalTo(self.autotrophyImageView);
        [make.right.mas_equalTo(self)setOffset:-10];
    }];
    
    [_freeSuitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.autotrophyImageView);
        [make.top.mas_equalTo(self.gridLabel.mas_bottom)setOffset:8];
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.autotrophyImageView);
        [make.top.mas_equalTo(self.freeSuitImageView.mas_bottom)setOffset:2];
    }];
    
    [_commentNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.autotrophyImageView);
        [make.top.mas_equalTo(self.priceLabel.mas_bottom)setOffset:2];
    }];
}

- (void)setFurnishingShowModel:(HomeFurnishingShowModel *)furnishingShowModel{
    _furnishingShowModel = furnishingShowModel;
    _priceLabel.text = [NSString stringWithFormat:@"¥ %@",furnishingShowModel.price];
    [_gridImageView sd_setImageWithURL:[NSURL URLWithString:furnishingShowModel.image_url] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _gridLabel.text = furnishingShowModel.main_title;
    _commentNumLabel.text = [NSString stringWithFormat:@"%@人已评价",furnishingShowModel.sales];
}

@end
