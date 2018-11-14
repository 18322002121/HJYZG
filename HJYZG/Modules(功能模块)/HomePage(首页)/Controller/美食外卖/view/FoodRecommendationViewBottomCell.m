//
//  FoodRecommendationViewBottomCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/9.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "FoodRecommendationViewBottomCell.h"

@interface FoodRecommendationViewBottomCell ()
/** 判断状态 */
@property (nonatomic,assign) BOOL isState;
@end

@implementation FoodRecommendationViewBottomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _imageViews = [[UIImageView alloc]init];
        _imageViews.backgroundColor = kRandomColor;
        [self addSubview:_imageViews];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_imageViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-10);
    }];
}

@end
