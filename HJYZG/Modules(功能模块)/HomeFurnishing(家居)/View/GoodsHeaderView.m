//
//  GoodsHeaderView.m
//  HJYZG
//
//  Created by HCY on 2018/9/16.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GoodsHeaderView.h"
#import "MainSideTitleModel.h"
@interface GoodsHeaderView ()
@property (nonatomic,strong) UILabel *headerTitle;
@end
@implementation GoodsHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _headerTitle = [[UILabel alloc]init];
        _headerTitle.font = [UIFont systemFontOfSize:13.0];
        _headerTitle.textColor = [UIColor blackColor];
        [self addSubview:_headerTitle];
    }
    return self;
}

- (void)layoutSubviews{
    [_headerTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
    }];
}



-(void)setHeaderTitleModel:(MainSideTitleModel *)headerTitleModel{
    _headerTitleModel = headerTitleModel;
    _headerTitle.text = headerTitleModel.title;
}


@end
