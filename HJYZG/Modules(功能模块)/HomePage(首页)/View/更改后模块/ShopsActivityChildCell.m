//
//  ShopsActivityChildCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/19.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ShopsActivityChildCell.h"

@interface ShopsActivityChildCell ()

@end

@implementation ShopsActivityChildCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imagesView = [[UIImageView alloc]init];
        [self addSubview:_imagesView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
    }];
}


@end
