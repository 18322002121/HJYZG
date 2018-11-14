//
//  MyWalletViewCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MyWalletViewCell.h"

@interface MyWalletViewCell ()
/** 钱包背景视图 */
@property (nonatomic,strong) UIView *walletBackView;
/** 总资产Label */
@property (nonatomic,strong) PublicLabel *totalAssetsLabel;
/** 总资产 */
@property (nonatomic,strong) PublicLabel *totalAssets;
/** 今日收益 */
@property (nonatomic,strong) PublicLabel *todayIncome;
/** 充值按钮 */
@property (nonatomic,strong) PublicButton *rechargeButton;
/** 总收益 */
@property (nonatomic,strong) PublicLabel *totalIncome;
/** 提现 */
@property (nonatomic,strong) PublicButton *putForwardButton;
/** 充值 */
@property (nonatomic,strong) PublicButton *rechargeButtons2;
/** 全部 */
@property (nonatomic,strong) PublicButton *wholeButton;
/** 支出 */
@property (nonatomic,strong) PublicButton *expenditureButton;
/** 收入 */
@property (nonatomic,strong) PublicButton *incomeButton;

@property (nonatomic,strong) PublicLabel *wholeButtonLabel;
@property (nonatomic,strong) PublicLabel *expenditureButtonLabel;
@property (nonatomic,strong) PublicLabel *incomeButtonLabel;
@end

@implementation MyWalletViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _walletBackView = [[UIView alloc]init];
        _walletBackView.backgroundColor = [UIColor colorWithRed:0.15 green:0.72 blue:0.53 alpha:1.00];
        _walletBackView.layer.cornerRadius = 10;
        [self addSubview:_walletBackView];
        
        _totalAssetsLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"总资产(RMB)" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_totalAssetsLabel];
        
        _totalAssets = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"18325.20元" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:21.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_totalAssets];
        
        _todayIncome = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"今日收益:31.22元" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_todayIncome];
        
        _rechargeButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"箭头_右" backgroundImageImage:@"" title:@"充值" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(rechargeClick:)];
        
        _totalIncome = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"总收益:332.32元" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_totalIncome];
        
        _putForwardButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleNormal) image:@"tixian" backgroundImageImage:@"" title:@"" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(putForwardClick:)];
        
        _putForwardButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _putForwardButton.layer.borderWidth = 0.5;
        _putForwardButton.layer.cornerRadius = 10;
        
        _rechargeButtons2 = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleNormal) image:@"chongzhi" backgroundImageImage:@"" title:@"" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(rechargeClick:)];
        _rechargeButtons2.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _rechargeButtons2.layer.borderWidth = 0.5;
        _rechargeButtons2.layer.cornerRadius = 10;
        
        _wholeButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleNormal) image:@"" backgroundImageImage:@"" title:@"全部" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(wholeClick)];
        
        _expenditureButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleNormal) image:@"" backgroundImageImage:@"" title:@"支出" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(expenditureClick)];
        
        _incomeButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleNormal) image:@"" backgroundImageImage:@"" title:@"收入" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(incomeClick)];
        
        
        _wholeButtonLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithRed:0.15 green:0.72 blue:0.53 alpha:1.00]];
        [self addSubview:_wholeButtonLabel];
        
        _expenditureButtonLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithRed:0.15 green:0.72 blue:0.53 alpha:1.00]];
        [self addSubview:_expenditureButtonLabel];
        
        _incomeButtonLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor colorWithRed:0.15 green:0.72 blue:0.53 alpha:1.00]];
        [self addSubview:_incomeButtonLabel];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_walletBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.height.mas_offset(@150);
    }];
    
    [_totalAssetsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.walletBackView.mas_left).offset(20);
        make.top.mas_equalTo(self.walletBackView.mas_top).offset(30);
    }];
    
    [_totalAssets mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.walletBackView.mas_left).offset(20);
        make.top.mas_equalTo(self.totalAssetsLabel.mas_bottom).offset(20);
    }];
    
    [_todayIncome mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.walletBackView.mas_left).offset(20);
        make.top.mas_equalTo(self.totalAssets.mas_bottom).offset(20);
    }];
    
    [_rechargeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.totalAssets.mas_centerY).offset(0);
        make.right.mas_equalTo(self.walletBackView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    
    [_totalIncome mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.walletBackView.mas_right).offset(-20);
        make.centerY.mas_equalTo(self.todayIncome.mas_centerY).offset(0);
    }];
    
    [@[_putForwardButton,_rechargeButtons2] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:20 tailSpacing:20];
    
    [@[_putForwardButton,_rechargeButtons2] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.walletBackView.mas_bottom).offset(20);
        make.height.mas_equalTo(80);
    }];
    
    [@[_wholeButton,_expenditureButton,_incomeButton] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:20 tailSpacing:20];
    
    [@[_wholeButton,_expenditureButton,_incomeButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.putForwardButton.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
    
    [_wholeButtonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.wholeButton.mas_centerX).offset(0);
        make.top.mas_equalTo(self.wholeButton.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(80, 2));
    }];
    
    [_expenditureButtonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.expenditureButton.mas_centerX).offset(0);
        make.top.mas_equalTo(self.expenditureButton.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(80, 2));
    }];
    
    [_incomeButtonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.incomeButton.mas_centerX).offset(0);
        make.top.mas_equalTo(self.incomeButton.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(80, 2));
    }];
    
}

#pragma mark - 充值按钮
- (void)rechargeClick:(UIButton *)sender{
    !_rechargeClick ? : _rechargeClick(sender);
}

#pragma mark - 提现按钮
- (void)putForwardClick:(UIButton *)sender{
    !_putForwardClick ? : _putForwardClick(sender);
}

#pragma mark - 全部按钮
- (void)wholeClick{
    NSLog(@"全部");
}

#pragma mark - 支出按钮
- (void)expenditureClick{
    NSLog(@"支出");
}

#pragma mark - 收入按钮
- (void)incomeClick{
    NSLog(@"收入");
}






@end
