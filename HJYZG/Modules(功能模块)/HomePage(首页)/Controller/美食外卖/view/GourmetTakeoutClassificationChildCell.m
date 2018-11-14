//
//  GourmetTakeoutClassificationChildCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/6.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GourmetTakeoutClassificationChildCell.h"

@interface GourmetTakeoutClassificationChildCell ()
@property (nonatomic,strong) UIImageView *categaryIconImageView;
@property (nonatomic,strong) PublicLabel *categaryTitleLabel;
@end

@implementation GourmetTakeoutClassificationChildCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _categaryIconImageView = [[UIImageView alloc]init];
        _categaryIconImageView.backgroundColor = kRandomColor;
        [self addSubview:_categaryIconImageView];
        
        _categaryTitleLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"测试测试" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_categaryTitleLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_categaryIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_categaryTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.categaryIconImageView.mas_bottom).offset(5);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
    }];
}

@end
