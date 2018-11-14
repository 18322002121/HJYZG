//
//  SelectedActivitiesHeaderView.m
//  HJYZG
//
//  Created by HCY on 2018/9/23.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SelectedActivitiesHeaderView.h"

@interface SelectedActivitiesHeaderView ()

@end

@implementation SelectedActivitiesHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imgView = [[UIImageView alloc]init];
        _imgView.backgroundColor = kRandomColor;
        [self addSubview:_imgView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
}

@end
