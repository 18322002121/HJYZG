//
//  NewsDynamicCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/13.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "NewsDynamicCell.h"

@interface NewsDynamicCell ()
@property (nonatomic,strong) UIImageView *images;
@property (nonatomic,strong) PublicLabel *titleLabel;
@property (nonatomic,strong) PublicLabel *lines;
@property (nonatomic,strong) PublicLabel *productDescription;
@end

@implementation NewsDynamicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _images = [[UIImageView alloc]init];
        _images.backgroundColor = [UIColor redColor];
        [self addSubview:_images];
        
        _titleLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"楼盘新闻" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_titleLabel];
        
        _lines = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor lightGrayColor]];
        [self addSubview:_lines];
        
        _productDescription = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"开盘在即，十月一日升级啦啦啦啦啦啦啦啦!!!" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentLeft backgroundColor:[UIColor clearColor]];
        _productDescription.numberOfLines = 0;
        [self addSubview:_productDescription];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_images mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.images.mas_top).offset(0);
        make.left.mas_equalTo(self.images.mas_right).offset(10);
    }];
    
    [_lines mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(5);
        make.centerY.mas_equalTo(self.titleLabel.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(1, 10));
    }];
    
    [_productDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.lines.mas_right).offset(5);
        make.top.mas_equalTo(self.titleLabel.mas_top).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-20);
    }];
    
    
}


@end
