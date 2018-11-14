//
//  BusinessListDetailsCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/7.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "BusinessListDetailsCell.h"
@interface BusinessListDetailsCell ()
/** 商品图片 */
@property (nonatomic,strong) UIImageView *shopShowImage;
/** 商品标题 */
@property (nonatomic,strong) PublicLabel *shopTitle;
/** 套餐种类 */
@property (nonatomic,strong) PublicLabel *foodSpecies;
/** 营业时间 */
@property (nonatomic,strong) PublicLabel *businessHours;

@property (nonatomic,strong) PublicLabel *lines;
/** 预约状态 */
@property (nonatomic,strong) PublicLabel *reservationState;
/** 现价 */
@property (nonatomic,strong) PublicLabel *presentPrice;
/** 折扣 */
@property (nonatomic,strong) PublicLabel *discount;
/** 原价 */
@property (nonatomic,strong) PublicLabel *originalPrice;
/** 抢购 */
@property (nonatomic,strong) PublicButton *rushToBuy;
/** 销量 */
@property (nonatomic,strong) PublicLabel *salesVolume;





@end
@implementation BusinessListDetailsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _shopShowImage = [[UIImageView alloc]init];
        _shopShowImage.backgroundColor = [UIColor redColor];
        [self addSubview:_shopShowImage];
        
        _shopTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"经典单人套餐" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_shopTitle];
        
        _foodSpecies = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"咖喱鸡饭套餐[选用优质鸡腿肉]" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_foodSpecies];
        
        _businessHours = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"周一至周日" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_businessHours];
        
        _lines = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor grayColor]];
        [self addSubview:_lines];
        
        _reservationState = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"免预约" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_reservationState];
        
        _presentPrice = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"¥18.9" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_presentPrice];
        
        _discount = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"¥8.3折" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_discount];
        _discount.layer.borderColor = [UIColor redColor].CGColor;
        _discount.layer.borderWidth = 0.5;
        
        _originalPrice = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"¥23" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_originalPrice];
        
        _rushToBuy = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"抢购" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.94 green:0.47 blue:0.04 alpha:1.00] addView:self target:self action:@selector(rushToBuyClick)];
        
        _salesVolume = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"半年销量 1539" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_salesVolume];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_shopShowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [_shopTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopShowImage.mas_right).offset(5);
        make.top.mas_equalTo(self.shopShowImage.mas_top).offset(0);
    }];
    
    [_foodSpecies mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopShowImage.mas_right).offset(10);
        make.top.mas_equalTo(self.shopTitle.mas_bottom).offset(5);
    }];
    
    [_businessHours mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopShowImage.mas_right).offset(10);
        make.top.mas_equalTo(self.foodSpecies.mas_bottom).offset(5);
    }];
    
    [_lines mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.businessHours.mas_right).offset(5);
        make.centerY.mas_equalTo(self.businessHours.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(1, 10));
    }];
    
    [_reservationState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lines.mas_right).offset(5);
        make.centerY.mas_equalTo(self.businessHours.mas_centerY).offset(0);
    }];
    
    [_presentPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopShowImage.mas_right).offset(10);
        make.top.mas_equalTo(self.businessHours.mas_bottom).offset(5);
        
    }];
    
    [_discount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.presentPrice.mas_centerY).offset(0);
        make.left.mas_equalTo(self.presentPrice.mas_right).offset(5);
    }];
    
    [_originalPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.presentPrice.mas_centerY).offset(0);
        make.left.mas_equalTo(self.discount.mas_right).offset(5);
    }];
    
    [_salesVolume mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.presentPrice.mas_centerY).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-10);
    }];
    
    [_rushToBuy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.salesVolume.mas_bottom).offset(-20);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
}

- (void)rushToBuyClick{
    NSLog(@"抢购");
}

@end
