//
//  GourmetTakeoutRecommendChildCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/5.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GourmetTakeoutRecommendChildCell.h"

@interface GourmetTakeoutRecommendChildCell ()
/**  商品图片 */
@property (nonatomic,strong) UIImageView *imageView;
/**  商品标题 */
@property (nonatomic,strong) PublicLabel *titleLabel;
/**  商品图标 */
@property (nonatomic,strong) UIImageView *storeImage;
/**  商品标题 */
@property (nonatomic,strong) PublicLabel *storeTitle;
/** 现在价格 */
@property (nonatomic,strong) PublicLabel *nowPrice;
/** 原来价格 */
@property (nonatomic,strong) PublicLabel *originalPrice;
/**  下单 */
@property (nonatomic,strong) PublicButton *placeOrder;
@end

@implementation GourmetTakeoutRecommendChildCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc]init];
        _imageView.backgroundColor = kRandomColor;
        [self addSubview:_imageView];
        
        _titleLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"鸡腿堡+鸡肉卷+中杯可乐" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_titleLabel];
        
        _storeImage = [[UIImageView alloc]init];
        _storeImage.backgroundColor = [UIColor greenColor];
        [self addSubview:_storeImage];
        
        _storeTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"美莱仕 (滑县店)" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_storeTitle];
        
        _nowPrice = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"¥18.495" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_nowPrice];
        
        _originalPrice = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"¥16.49" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_originalPrice];
        
        _placeOrder =[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"一键下单" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:11.0] backgroundColor:[UIColor colorWithRed:0.99 green:0.74 blue:0.22 alpha:1.00] addView:self target:self action:@selector(placeOrderClick)];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.height.mas_offset(@(self.frame.size.height * 0.4));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(5);
    }];
    
    [_storeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_storeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.storeImage.mas_right).offset(10);
        make.centerY.mas_equalTo(self.storeImage.mas_centerY).offset(0);
    }];
    
    [_nowPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.storeImage.mas_bottom).offset(5);
    }];

    [_originalPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nowPrice.mas_right).offset(10);
        make.centerY.mas_equalTo(self.nowPrice.mas_centerY).offset(0);
    }];
    
    [_placeOrder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.top.mas_equalTo(self.nowPrice.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
}

- (void)placeOrderClick{
    NSLog(@"下单");
}


@end
