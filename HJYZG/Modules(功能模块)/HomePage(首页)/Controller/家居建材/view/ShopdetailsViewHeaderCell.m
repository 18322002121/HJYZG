//
//  ShopdetailsViewHeaderCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/3.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ShopdetailsViewHeaderCell.h"
#define MAS_height 10

@interface ShopdetailsViewHeaderCell ()
/** 商品图片 */
@property (nonatomic,strong) UIImageView *bannerImage;
/** 商品标题 */
@property (nonatomic,strong) PublicLabel *titleLabel;
/** 商品描述 */
@property (nonatomic,strong) PublicLabel *descriptionLabel;
/** 商品现价 */
@property (nonatomic,strong) PublicLabel *shopPrice;
/** 商品原价 */
@property (nonatomic,strong) PublicLabel *shopOriginalPrice;
/** 配送说明 */
@property (nonatomic,strong) PublicLabel *distributionInstructions;
/** 数量label */
@property (nonatomic,strong) PublicLabel *numberLabel;
/** 减少 */
@property (nonatomic,strong) UIButton *reduceButton;
/** 数量 */
@property (nonatomic,strong) PublicLabel *numbers;
/** 增加 */
@property (nonatomic,strong) UIButton *increaseButton;
/** 销量 */
@property (nonatomic,strong) PublicLabel *salesVolume;

@end
@implementation ShopdetailsViewHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        /** 商品图片 */
        _bannerImage = [[UIImageView alloc]init];
        _bannerImage.backgroundColor = [UIColor greenColor];
        _bannerImage.image = [UIImage imageNamed:@"cc.jpg"];
        [self addSubview:_bannerImage];
        
        /** 商品标题 */
        _titleLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"福金家居转角沙发" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_titleLabel];
        
        /** 商品描述 */
        _descriptionLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"人工茶几" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_descriptionLabel];
        
        /** 商品现价 */
        _shopPrice = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"¥ 13000 /套" textColor:[UIColor redColor] font:[UIFont systemFontOfSize:18.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_shopPrice];
        
        /** 商品原价 */
        _shopOriginalPrice = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"¥ 15000" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_shopOriginalPrice];
        //删除线
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:_shopOriginalPrice.text attributes:attribtDic];
        _shopOriginalPrice.attributedText = attribtStr;
        
        /** 配送说明 */
        _distributionInstructions = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"配送说明：配送价格：100元" textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_distributionInstructions];
        
        /** 数量label */
        _numberLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"数量：" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_numberLabel];
        
        /** 减少 */
        _increaseButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"+" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:18.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(increaseClick)];
        _increaseButton.layer.borderColor = [UIColor grayColor].CGColor;
        _increaseButton.layer.borderWidth = 0.5;
        
        /** 数量 */
        _numbers = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"18" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_numbers];
        
        /** 增加 */
         _reduceButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"-" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:18.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(reduceClick)];
        _reduceButton.layer.borderColor = [UIColor grayColor].CGColor;
        _reduceButton.layer.borderWidth = 0.5;
        
        /** 销量 */
        _salesVolume = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"销量：6" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_salesVolume];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    /** 商品图片 */
    [_bannerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.height.mas_offset(220);
    }];
    /** 商品标题 */
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bannerImage.mas_bottom).offset(MAS_height);
        make.left.mas_equalTo(self.mas_left).offset(20);
        
    }];
    /** 商品描述 */
    [_descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(MAS_height);
        make.left.mas_equalTo(self.mas_left).offset(20);
    }];
    /** 商品现价 */
    [_shopPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.descriptionLabel.mas_bottom).offset(MAS_height);
        make.left.mas_equalTo(self.mas_left).offset(20);
    }];
     /** 商品原价 */
    [_shopOriginalPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shopPrice.mas_bottom).offset(MAS_height);
        make.left.mas_equalTo(self.mas_left).offset(20);
    }];
    /** 配送说明 */
    [_distributionInstructions mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shopOriginalPrice.mas_bottom).offset(MAS_height);
        make.left.mas_equalTo(self.mas_left).offset(20);
    }];
    /** 数量label */
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.distributionInstructions.mas_bottom).offset(MAS_height);
        make.left.mas_equalTo(self.mas_left).offset(20);
    }];
    /** 减少 */
    [_reduceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.numberLabel.mas_right).offset(5);
        make.centerY.mas_equalTo(self.numberLabel.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(30, 20));
    }];
    /** 数量 */
    [_numbers mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.reduceButton.mas_right).offset(10);
        make.centerY.mas_equalTo(self.numberLabel.mas_centerY).offset(0);
    }];
    /** 增加 */
    [_increaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.numbers.mas_right).offset(10);
        make.centerY.mas_equalTo(self.numberLabel.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(30, 20));
    }];
    /** 销量 */
    [_salesVolume mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.centerY.mas_equalTo(self.numberLabel.mas_centerY).offset(0);
    }];
    
}

//按钮点击事件
/** 减少 */
- (void)reduceClick{
    NSInteger numberCount = [self.numbers.text integerValue];
    numberCount--;
    if (numberCount <=0) {
        return;
    }
    self.numbers.text = [NSString stringWithFormat:@"%ld",numberCount];
//    !_ReduceButton ? : _ReduceButton(numberCount);
}

/** 新增 */
- (void)increaseClick{
    NSInteger numberCount = [self.numbers.text integerValue];
    numberCount++;
    self.numbers.text = [NSString stringWithFormat:@"%ld",numberCount];
//    !_IncreaseButton ? : _IncreaseButton(numberCount);
    
    
}

@end
