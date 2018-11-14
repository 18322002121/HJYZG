//
//  ANewHouseMoreInformationCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/4.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ANewHouseMoreInformationCell.h"

@implementation ANewHouseMoreInformationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabels = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"基本信息" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_titleLabels];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [_titleLabels mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
    }];
}

@end
