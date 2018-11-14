//
//  PanoramaCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/24.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "PanoramaCell.h"
#import "GoodsClassificationModel.h"

@interface PanoramaCell ()
@property (nonatomic,strong) UIImageView *imgView;
@end
@implementation PanoramaCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _imgView = [[UIImageView alloc]init];
        _imgView.backgroundColor = kRandomColor;
        [self addSubview:_imgView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
    }];
}

- (void)setGoodsClassModel:(GoodsClassificationModel *)goodsClassModel{
    _goodsClassModel = goodsClassModel;
    _imgView.image =[UIImage imageNamed:goodsClassModel.iconImage];
}

@end
