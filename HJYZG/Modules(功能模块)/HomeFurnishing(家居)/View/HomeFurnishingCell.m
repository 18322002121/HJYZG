//
//  HomeFurnishingCell.m
//  HJYZG
//
//  Created by HCY on 2018/8/14.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HomeFurnishingCell.h"

@implementation HomeFurnishingCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.iconImage=[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor greenColor] addView:self.contentView target:self action:@selector(iconImageClick:)];
        
        self.name=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"123" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor yellowColor]];
        [self.contentView addSubview:self.name];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(2);
        make.left.mas_equalTo(self.contentView.mas_left).offset(2);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-2);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-2);
    }];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(2);
        make.left.mas_equalTo(self.contentView.mas_left).offset(2);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-2);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-2);
    }];
}


- (void)iconImageClick:(UIButton *)sender{
    !_iconImageButton ? : _iconImageButton(sender);
    if (sender.highlighted) {
        NSLog(@"我被选中了");
    }
    
    
}


@end
