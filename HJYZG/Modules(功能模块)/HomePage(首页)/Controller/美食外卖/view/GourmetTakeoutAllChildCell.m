//
//  GourmetTakeoutAllChildCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/5.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GourmetTakeoutAllChildCell.h"

@interface GourmetTakeoutAllChildCell ()
@property (nonatomic,strong) UIImageView *shopImage;
@property (nonatomic,strong) PublicLabel *titleLabel;
@end

@implementation GourmetTakeoutAllChildCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _shopImage = [[UIImageView alloc]init];
        _shopImage.backgroundColor = kRandomColor;
        [self addSubview:_shopImage];
        
        _titleLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"快餐便当" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_shopImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.height.mas_equalTo(@80);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shopImage.mas_bottom).offset(5);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
    }];
}

@end
