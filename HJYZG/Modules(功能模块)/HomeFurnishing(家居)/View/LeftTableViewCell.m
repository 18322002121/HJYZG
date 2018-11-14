//
//  LeftTableViewCell.m
//  HJYZG
//
//  Created by HCY on 2018/8/14.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "LeftTableViewCell.h"

@implementation LeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    
        self.name=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"测试" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        self.name.numberOfLines = 0;
        self.name.highlightedTextColor = [UIColor greenColor];
        [self.contentView addSubview:self.name];
        

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.contentView.backgroundColor = selected ? [UIColor blackColor] : [UIColor colorWithRed:0.56 green:0.08 blue:0.15 alpha:1.00];
    self.highlighted = selected;
    self.name.highlighted = selected;

}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.top.mas_equalTo(self.contentView.mas_top).offset(1);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-1);
    }];
}


@end
