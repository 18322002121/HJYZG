//
//  ShopdetailsViewCenterCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/3.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ShopdetailsViewCenterCell.h"

@interface ShopdetailsViewCenterCell ()
/** 商家图片 */
@property (nonatomic,strong) UIImageView *shopImage;
/** 商家标题 */
@property (nonatomic,strong) PublicLabel *shopTitle;
/** 进店逛逛 */
@property (nonatomic,strong) PublicLabel *enterTheShop;
@end
@implementation ShopdetailsViewCenterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _shopImage = [[UIImageView alloc]init];
        _shopImage.backgroundColor = [UIColor redColor];
        [self addSubview:_shopImage];
        
        _shopTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"福金家居有限公司" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_shopTitle];
        
        _enterTheShop = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"进店逛逛" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        _enterTheShop.layer.borderWidth = 0.5;
        _enterTheShop.layer.borderColor = [UIColor redColor].CGColor;
        [self addSubview:_enterTheShop];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_shopImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [_shopTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.shopImage.mas_centerY).offset(0);
        make.left.mas_equalTo(self.shopImage.mas_right).offset(10);
    }];
    
    [_enterTheShop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.shopImage.mas_centerY).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
}


@end
