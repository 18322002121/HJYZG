//
//  LeftSideOfGoodsCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "LeftSideOfGoodsCell.h"
#import "LeftSideTitleModel.h"
@interface LeftSideOfGoodsCell()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *backView;
@end
@implementation LeftSideOfGoodsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _backView= [[UIView alloc]init];
        _backView.layer.cornerRadius=15;
        [self addSubview:_backView];
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        [self.backView addSubview:_titleLabel];
        _titleLabel.font = [UIFont systemFontOfSize:13.0];
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        _backView.backgroundColor=[UIColor redColor];
        _titleLabel.textColor=[UIColor whiteColor];
    }else{
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textColor=[UIColor blackColor];
        _backView.backgroundColor=[UIColor clearColor];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(5);
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-10);
        make.right.mas_equalTo(self.mas_right).offset(-5);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.backView.mas_left).offset(0);
        make.top.mas_equalTo(self.backView.mas_top).offset(0);
        make.bottom.mas_equalTo(self.backView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.backView.mas_right).offset(0);
    }];
}

- (void)setTitleModel:(LeftSideTitleModel *)titleModel{
    _titleModel = titleModel;
    self.titleLabel.text = titleModel.title;
}

@end
