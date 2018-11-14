//
//  GourmetTakeoutCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/5.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GourmetTakeoutCell.h"

@interface GourmetTakeoutCell ()
/** 商店图片 */
@property (nonatomic,strong) UIImageView *shopIconImage;
/** 商店图片 */
@property (nonatomic,strong) PublicLabel *shopTitle;
/** 五星背景 */
@property (nonatomic,strong) UIView *startBackView;
/** 好评分数 */
@property (nonatomic,strong) PublicLabel *praise;
/** 月售数量 */
@property (nonatomic,strong) PublicLabel *monthlySale;
/** 起送 */
@property (nonatomic,strong) PublicLabel *takeOff;
/** 配送 */
@property (nonatomic,strong) PublicLabel *distribution;
/** 人均 */
@property (nonatomic,strong) PublicLabel *perCapita;
/** 口碑 */
@property (nonatomic,strong) PublicLabel *wordMouth;
/** 分割线1 */
@property (nonatomic,strong) PublicLabel *segmentingLine1;
/** 分割线2 */
@property (nonatomic,strong) PublicLabel *segmentingLine2;
/** 配送时间 */
@property (nonatomic,strong) PublicLabel *distributionTime;
/** 分割线3 */
@property (nonatomic,strong) PublicLabel *segmentingLine3;
/** 距离 */
@property (nonatomic,strong) PublicLabel *distance;
/** 折扣背景 */
@property (nonatomic,strong) UIView *discountBackView;

@end

@implementation GourmetTakeoutCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor whiteColor];
        
        _shopIconImage = [[UIImageView alloc]init];
        _shopIconImage.backgroundColor = [UIColor redColor];
        [self addSubview:_shopIconImage];
        
        _shopTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"德克士" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_shopTitle];
        
        _startBackView = [[UIView alloc]init];
        _startBackView.backgroundColor = [UIColor yellowColor];
        [self addSubview:_startBackView];
        
        _praise = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"4.8" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_praise];
        
        _monthlySale = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"月售854" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_monthlySale];
        
        _takeOff = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"起送¥20" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_takeOff];
        
        _segmentingLine1 = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor grayColor]];
        [self addSubview:_segmentingLine1];
        
        _distribution = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"配送¥3" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_distribution];
        
        _segmentingLine2 = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor grayColor]];
        [self addSubview:_segmentingLine2];
        
        _perCapita = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"人均¥23" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_perCapita];
        
        _wordMouth = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"滑县西式快餐口碑第三名" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_wordMouth];
        
        _distributionTime = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"30分钟" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_distributionTime];
        
        _segmentingLine3 = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor grayColor]];
        [self addSubview:_segmentingLine3];
        
        _distance = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"745m" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:11.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_distance];
        
        _discountBackView = [[UIView alloc]init];
        _discountBackView.backgroundColor = [UIColor greenColor];
        [self addSubview:_discountBackView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_shopIconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 70));
    }];
    
    [_shopTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shopIconImage.mas_right).offset(10);
        make.top.mas_equalTo(self.shopIconImage.mas_top).offset(0);
    }];
    
    [_startBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.shopTitle.mas_bottom).offset(5);
        make.left.mas_equalTo(self.shopIconImage.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
    [_praise mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.startBackView.mas_right).offset(1);
        make.centerY.mas_equalTo(self.startBackView.mas_centerY).offset(0);
    }];
    
    [_monthlySale mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.startBackView.mas_centerY).offset(0);
        make.left.mas_equalTo(self.praise.mas_right).offset(5);
    }];
    
    [_takeOff mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.startBackView.mas_bottom).offset(5);
        make.left.mas_equalTo(self.shopIconImage.mas_right).offset(10);
    }];
    
    [_segmentingLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.takeOff.mas_right).offset(5);
        make.centerY.mas_equalTo(self.takeOff.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(1, 10));
    }];
    
    [_distribution mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.takeOff.mas_centerY).offset(0);
        make.left.mas_equalTo(self.segmentingLine1.mas_right).offset(2);
    }];
    
    [_segmentingLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.distribution.mas_right).offset(5);
        make.centerY.mas_equalTo(self.takeOff.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(1, 10));
    }];
    
    [_perCapita mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.takeOff.mas_centerY).offset(0);
        make.left.mas_equalTo(self.segmentingLine2.mas_right).offset(2);
    }];
    
    [_wordMouth mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.perCapita.mas_bottom).offset(5);
        make.left.mas_equalTo(self.shopIconImage.mas_right).offset(10);
    }];
    
    [_distance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.centerY.mas_equalTo(self.startBackView.mas_centerY).offset(0);
    }];
    
    [_segmentingLine3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.startBackView.mas_centerY).offset(0);
        make.right.mas_equalTo(self.distance.mas_left).offset(-2);
        make.size.mas_equalTo(CGSizeMake(1, 10));
    }];
    
    [_distributionTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.segmentingLine3.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.startBackView.mas_centerY).offset(0);
    }];
    
    [_discountBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.wordMouth.mas_bottom).offset(5);
        make.left.mas_equalTo(self.shopIconImage.mas_right).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-80);
        make.height.mas_offset(@40);
    }];

}




@end
