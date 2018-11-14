//
//  MortgageCalculationResultCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MortgageCalculationResultCell.h"
#import "HousingLoanResultsModel.h"

@implementation MortgageCalculationResultCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _leftTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"123" textColor:[UIColor darkGrayColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentLeft backgroundColor:[UIColor clearColor]];
        [self addSubview:_leftTitle];
        
        _centerTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"321" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_centerTitle];
        
        _rightTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"213" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentRight backgroundColor:[UIColor clearColor]];
        [self addSubview:_rightTitle];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [@[_leftTitle,_centerTitle,_rightTitle] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:1 leadSpacing:20 tailSpacing:20];
    
    [@[_leftTitle,_centerTitle,_rightTitle] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.height.mas_equalTo(20);
    }];
}

- (void)setLoanResultsModel:(HousingLoanResultsModel *)loanResultsModel{
    _loanResultsModel = loanResultsModel;
    self.leftTitle.text = loanResultsModel.leftTitle;
    self.centerTitle.text = loanResultsModel.centerTitle;
    self.rightTitle.text = loanResultsModel.rightTitle;
}

@end
