//
//  SupermarketHeaderView.m
//  HJYZG
//
//  Created by HCY on 2018/10/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "SupermarketHeaderView.h"
#import "SupermarketModel.h"

@interface SupermarketHeaderView ()
@property (nonatomic,strong) UILabel *headerTitle;
@end
@implementation SupermarketHeaderView

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



//-(void)setHeaderTitleModel:(MainSideTitleModel *)headerTitleModel{
//    _headerTitleModel = headerTitleModel;
//    _headerTitle.text = headerTitleModel.title;
//}

- (void)setHeaderTitleModel:(SupermarketModel *)headerTitleModel{
    _headerTitleModel = headerTitleModel;
    _headerTitle.text = headerTitleModel.title;
}


@end
