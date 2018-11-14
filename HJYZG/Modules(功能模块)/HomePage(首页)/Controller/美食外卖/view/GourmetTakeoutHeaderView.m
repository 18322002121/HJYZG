//
//  GourmetTakeoutHeaderView.m
//  HJYZG
//
//  Created by HCY on 2018/10/6.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GourmetTakeoutHeaderView.h"

@interface GourmetTakeoutHeaderView ()
/** 综合排序 */
@property (nonatomic,strong) PublicButton *comprehensiveButton;
/** 销量 */
@property (nonatomic,strong) PublicButton *salesVolumeButton;
/** 距离 */
@property (nonatomic,strong) PublicButton *distanceButton;
/** 筛选 */
@property (nonatomic,strong) PublicButton *screenButton;
/** 满减优惠 */
@property (nonatomic,strong) PublicButton *discountButton;
/** 新商家 */
@property (nonatomic,strong) PublicButton *businessButton;
/** 惠家专送 */
@property (nonatomic,strong) PublicButton *specialDeliveryButton;
/** 0元起送 */
@property (nonatomic,strong) PublicButton *takeOffButton;
@end

@implementation GourmetTakeoutHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _comprehensiveButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"" backgroundImageImage:@"" title:@"综合排序" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.97 green:0.99 blue:1.00 alpha:1.00] addView:self target:self action:@selector(reloadClick:)];
        
        _salesVolumeButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"销量" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.97 green:0.99 blue:1.00 alpha:1.00] addView:self target:self action:@selector(reloadClick:)];
        
        _distanceButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"距离" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.97 green:0.99 blue:1.00 alpha:1.00] addView:self target:self action:@selector(reloadClick:)];
        
        _screenButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"" backgroundImageImage:@"" title:@"筛选" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.97 green:0.99 blue:1.00 alpha:1.00] addView:self target:self action:@selector(reloadClick:)];
        
        _discountButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"满减优惠" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.97 green:0.99 blue:1.00 alpha:1.00] addView:self target:self action:@selector(reloadClick:)];
        
        _businessButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"新商家" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.97 green:0.99 blue:1.00 alpha:1.00] addView:self target:self action:@selector(reloadClick:)];
        
        _specialDeliveryButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"美团专送" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.97 green:0.99 blue:1.00 alpha:1.00] addView:self target:self action:@selector(reloadClick:)];
        
        _takeOffButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"0元起送" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor colorWithRed:0.97 green:0.99 blue:1.00 alpha:1.00] addView:self target:self action:@selector(reloadClick:)];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [@[_comprehensiveButton,_salesVolumeButton,_distanceButton,_screenButton] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:0 tailSpacing:0];
    
    [@[_comprehensiveButton,_salesVolumeButton,_distanceButton,_screenButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.height.mas_equalTo(20);
    }];
    
    [@[_discountButton,_businessButton,_specialDeliveryButton,_takeOffButton] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:0 tailSpacing:0];
    
    [@[_discountButton,_businessButton,_specialDeliveryButton,_takeOffButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.comprehensiveButton.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
    }];
}

//点击事件
- (void)reloadClick:(UIButton *)sender{
    !_reloadButton ? : _reloadButton(sender);
}


@end
