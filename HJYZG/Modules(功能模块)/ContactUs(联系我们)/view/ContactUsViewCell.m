//
//  ContactUsViewCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/11.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ContactUsViewCell.h"
@interface ContactUsViewCell ()
@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) PublicLabel *contacts;
@property (nonatomic,strong) PublicLabel *content;
@property (nonatomic,strong) PublicLabel *time;

@end
@implementation ContactUsViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _iconImage = [[UIImageView alloc]init];
        _iconImage.backgroundColor = kRandomColor;
        [self addSubview:_iconImage];
        
        _contacts = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"王某某" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:16.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_contacts];
        
        _content = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"你好呀！" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_content];
        
        _time = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"14:20" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_time];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_contacts mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.iconImage.mas_centerY).offset(-10);
        make.left.mas_equalTo(self.iconImage.mas_right).offset(10);
    }];
    
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImage.mas_centerY).offset(10);
        make.left.mas_equalTo(self.iconImage.mas_right).offset(10);
    }];
    
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contacts.mas_centerY).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-20);
    }];
    
}

@end
