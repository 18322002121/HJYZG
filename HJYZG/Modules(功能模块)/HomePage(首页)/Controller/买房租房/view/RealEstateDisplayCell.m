//
//  RealEstateDisplayCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/12.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "RealEstateDisplayCell.h"

@interface RealEstateDisplayCell ()
@property (nonatomic,strong) UIImageView *showImages;
@end

@implementation RealEstateDisplayCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _showImages = [[UIImageView alloc]init];
        _showImages.backgroundColor = kRandomColor;
        [self addSubview:_showImages];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_showImages mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.left.mas_equalTo(self.mas_left).offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-5);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-5);
    }];
}

@end
