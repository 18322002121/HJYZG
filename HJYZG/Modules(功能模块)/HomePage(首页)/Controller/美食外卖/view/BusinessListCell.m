//
//  BusinessListCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/7.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "BusinessListCell.h"

@interface BusinessListCell ()
@property (nonatomic,strong) UIImageView *shopIcon;
@property (nonatomic,strong) PublicLabel *title;
@property (nonatomic,strong) UIView *starView;
@property (nonatomic,strong) PublicLabel *perCapita;
@property (nonatomic,strong) PublicLabel *region;
@property (nonatomic,strong) PublicLabel *classification;
@property (nonatomic,strong) UIImageView *discountImage;
@property (nonatomic,strong) PublicLabel *discountDiscription;
@property (nonatomic,strong) PublicLabel *currentPopularity;

@end

@implementation BusinessListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _shopIcon = [[UIImageView alloc]init];
        _shopIcon.backgroundColor = [UIColor greenColor];
        [self addSubview:_shopIcon];
        
        _title = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"犟骨头排骨饭(解放店)" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_title];
        
        _starView = [[UIView alloc]init];
        _starView.backgroundColor = [UIColor redColor];
        [self addSubview:_starView];
        
        _perCapita = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"¥18/人" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_perCapita];
        
        _region = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"银座" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_region];
        
        _classification = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"排骨米饭" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_classification];
        
        _discountImage = [[UIImageView alloc]init];
        _discountImage.backgroundColor = [UIColor greenColor];
        [self addSubview:_discountImage];
        
        _discountDiscription = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"7.8元蛋挞,9.9元酸奶果粒方。" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_discountDiscription];
        
        _currentPopularity = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"当前人气75" textColor:[UIColor colorWithRed:0.98 green:0.51 blue:0.03 alpha:1.00] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_currentPopularity];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [_shopIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shopIcon.mas_top).offset(0);
        make.left.mas_equalTo(self.shopIcon.mas_right).offset(10);
    }];
    
    [_starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopIcon.mas_right).offset(10);
        make.top.mas_equalTo(self.title.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
    [_perCapita mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.starView.mas_centerY).offset(0);
        make.left.mas_equalTo(self.starView.mas_right).offset(10);
    }];
    
    [_region mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.starView.mas_bottom).offset(5);
        make.left.mas_equalTo(self.shopIcon.mas_right).offset(10);
    }];
    
    [_classification mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.region.mas_right).offset(10);
        make.centerY.mas_equalTo(self.region.mas_centerY).offset(0);
    }];
    
    [_discountImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.region.mas_bottom).offset(5);
        make.left.mas_equalTo(self.shopIcon.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_discountDiscription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.discountImage.mas_right).offset(5);
        make.centerY.mas_equalTo(self.discountImage.mas_centerY).offset(0);
    }];
    
    [_currentPopularity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.centerY.mas_equalTo(self.region.mas_centerY).offset(0);
    }];
    
}

@end
