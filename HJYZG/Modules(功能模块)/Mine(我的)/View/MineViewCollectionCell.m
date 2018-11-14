//
//  MineViewCollectionCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/12.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MineViewCollectionCell.h"

@interface MineViewCollectionCell ()
@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) PublicLabel *iconTitle;
@end

@implementation MineViewCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 15;
        self.backgroundColor = [UIColor greenColor];
        _iconImage = [[UIImageView alloc]init];
        _iconImage.backgroundColor = kRandomColor;
        [self addSubview:_iconImage];
        
        _iconTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"待发货" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_iconTitle];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_iconTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.top.mas_equalTo(self.iconImage.mas_bottom).offset(10);
    }];
    
    
}

@end
