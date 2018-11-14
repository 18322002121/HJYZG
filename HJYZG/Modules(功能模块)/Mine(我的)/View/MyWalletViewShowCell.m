//
//  MyWalletViewShowCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MyWalletViewShowCell.h"

@interface MyWalletViewShowCell ()

/** 在线支付Label */
@property (nonatomic,strong) PublicLabel *onlinePayment;
/** 余额 */
@property (nonatomic,strong) PublicLabel *balancel;
/** 日期 */
@property (nonatomic,strong) PublicLabel *dates;
/** 收支金额 */
@property (nonatomic,strong) PublicLabel *incomeExpenditure;


@end
@implementation MyWalletViewShowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _onlinePayment = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"在线支付" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_onlinePayment];
        
        _balancel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"余额：0.00" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_balancel];
        
        _dates = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"2018-10-08" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_dates];
        
        _incomeExpenditure = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"-8.00" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_incomeExpenditure];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [_onlinePayment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.top.mas_equalTo(self.mas_top).offset(10);
    }];
    
    [_balancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.onlinePayment.mas_bottom).offset(20);
        make.left.mas_equalTo(self.mas_left).offset(20);
    }];
    
    [_dates mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.centerY.mas_equalTo(self.onlinePayment.mas_centerY).offset(0);
    }];
    
    [_incomeExpenditure mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.balancel.mas_centerY).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-20);
    }];
    
    
}



@end
