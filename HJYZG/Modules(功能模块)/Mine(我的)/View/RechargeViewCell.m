//
//  RechargeViewCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "RechargeViewCell.h"

@interface RechargeViewCell ()
@property (nonatomic,strong) PublicLabel *titleLabel;
@property (nonatomic,strong) PublicTextfield *inputField;
@end

@implementation RechargeViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_titleLabel];
        
        _inputField = [PublicTextfield textFieldWithFrame:CGRectMake(0, 0, 0, 0) background:[UIImage imageNamed:@""] secureTextEntry:NO placeholder:@"" clearsOnBeginEditing:NO];
        [self addSubview:_inputField];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
    }];
    
    [_inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-20);
        make.height.mas_offset(@40);
    }];
}


@end
