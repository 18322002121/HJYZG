//
//  MortgageCalculationTwoCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/14.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MortgageCalculationTwoCell.h"

@implementation MortgageCalculationTwoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _leftTwoTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_leftTwoTitle];
        
        _centerTextfield = [PublicTextfield textFieldWithFrame:CGRectMake(0, 0, 0, 0) background:[UIImage imageNamed:@""] secureTextEntry:NO placeholder:@"" clearsOnBeginEditing:NO];
        [_centerTextfield setValue:[UIFont boldSystemFontOfSize:11.0] forKeyPath:@"_placeholderLabel.font"];
        _centerTextfield.font = [UIFont systemFontOfSize:13.0];
        _centerTextfield.textAlignment = NSTextAlignmentRight;
        [_centerTextfield addTarget:self action:@selector(reloadTextfield:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:_centerTextfield];
        
        _rightTwoTitle = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"万元" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_rightTwoTitle];
    }
    return self;
}

- (void)reloadTextfield:(UITextField *)textfield{
    !_reloadTextfield ? : _reloadTextfield(textfield);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_leftTwoTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];

    [_centerTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftTwoTitle.mas_right).offset(10);
        make.right.mas_equalTo(self.rightTwoTitle.mas_left).offset(-5);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.height.mas_offset(@40);
    }];
    
    [_rightTwoTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
    }];
    
}


@end
