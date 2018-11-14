//
//  SettlementView.m
//  HJYZG
//
//  Created by HCY on 2018/8/16.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SettlementView.h"

@implementation SettlementView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        self.selectClick=[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"未选中框" backgroundImageImage:@"" title:@"" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(selectClick:)];
        [self.selectClick setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateSelected];
        
        self.allSelectLabel=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"全选" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:self.allSelectLabel];
        
        self.totalPriceLabel=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"合计:" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:self.totalPriceLabel];
        
        self.totalPrice=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"¥8000" textColor:[UIColor redColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:self.totalPrice];
        
        self.settlement=[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"结算(0)" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor redColor] addView:self target:self action:@selector(settlementCLick:)];
        self.settlement.layer.cornerRadius = 15;
        [self addSubview:self.settlement];
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.selectClick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.size.mas_equalTo(CGSizeMake(16, 16));
    }];
    
    [self.allSelectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.selectClick.mas_centerY).offset(0);
        make.left.mas_equalTo(self.selectClick.mas_right).offset(10);
    }];

    [self.settlement mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.allSelectLabel.mas_centerY).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    [self.totalPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.right.mas_equalTo(self.settlement.mas_left).offset(-10);
    }];
    
    [self.totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.right.mas_equalTo(self.totalPrice.mas_left).offset(-10);
    }];
    
}

//全选
- (void)selectClick:(UIButton *)sender{
    !_selectButton ? : _selectButton(sender);
}

//结算
- (void)settlementCLick:(UIButton *)sender{
    !_settlementButton ? : _settlementButton(sender);
}


@end
