//
//  RenovationCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/24.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "RenovationCell.h"
#import "SelectedActivitiesModel.h"
@interface RenovationCell ()
@property (nonatomic,strong) UIImageView *showImage;
@property (nonatomic,strong) UILabel *showLabel;
@end

@implementation RenovationCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _showImage = [[UIImageView alloc]init];
        [self addSubview:_showImage];
        
        _showLabel = [[UILabel alloc]init];
        _showLabel.font = [UIFont systemFontOfSize:13.0];
        _showLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_showLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_showImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.height.mas_offset(140);
    }];
    
    [_showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.showImage.mas_bottom).offset(10);
        make.left.mas_equalTo(self.mas_left).offset(0);
    }];
    
}

- (void)setSelectedActivitie:(SelectedActivitiesModel *)selectedActivitie{
    _selectedActivitie = selectedActivitie;
    _showImage.image = [UIImage imageNamed:selectedActivitie.image_url];
    _showLabel.text = selectedActivitie.nature;
}


@end
