//
//  SupermarketShowCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/8.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SupermarketShowCell.h"

@interface SupermarketShowCell ()
@property (nonatomic,strong) UIImageView *shopImage;
@property (nonatomic,strong) PublicLabel *shopDescription;
@property (nonatomic,strong) PublicLabel *shopPrice;
@end

@implementation SupermarketShowCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _shopImage = [[UIImageView alloc]init];
        _shopImage.backgroundColor = kRandomColor;
        [self addSubview:_shopImage];
        
        _shopDescription = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"【白酒】剑南春珍藏级浓香型52度500ML" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        _shopDescription.numberOfLines = 0;
        [self addSubview:_shopDescription];
        
        _shopPrice = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"¥600元/瓶" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_shopPrice];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_shopImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.left.mas_equalTo(self.mas_left).offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-5);
        make.height.mas_offset(@180);
    }];
    
    [_shopDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shopImage.mas_bottom).offset(5);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-5);
    }];
    
    [_shopPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shopDescription.mas_bottom).offset(5);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
    }];
    
    
    
}

@end
