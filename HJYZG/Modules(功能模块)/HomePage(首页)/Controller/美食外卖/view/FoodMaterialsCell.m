//
//  FoodMaterialsCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/9.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "FoodMaterialsCell.h"
@interface FoodMaterialsCell ()
@property (nonatomic,strong) UIImageView *imageS;
@property (nonatomic,strong) PublicLabel *titles;
@property (nonatomic,strong) PublicButton *reduce;
@property (nonatomic,strong) PublicButton *increase;
@property (nonatomic,strong) PublicLabel *numbers;
@end
@implementation FoodMaterialsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _imageS = [[UIImageView alloc]init];
        _imageS.backgroundColor = [UIColor greenColor];
        [self addSubview:_imageS];
        
        _titles = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"大白菜" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_titles];
        
        _reduce = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"-" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:15.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(reduceClick)];
        _reduce.layer.borderWidth = 0.5;
        _reduce.layer.borderColor = [UIColor grayColor].CGColor;
        [self addSubview:_reduce];
        
        _numbers = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"8" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_numbers];
        
        _increase = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"+" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:15.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(increaseClick)];
        _increase.layer.borderWidth = 0.5;
        _increase.layer.borderColor = [UIColor grayColor].CGColor;
        [self addSubview:_increase];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_imageS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.imageS.mas_centerY).offset(0);
        make.left.mas_equalTo(self.imageS.mas_right).offset(10);
    }];
    
    [_increase mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.imageS.mas_centerY).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_numbers mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.imageS.mas_centerY).offset(0);
        make.right.mas_equalTo(self.increase.mas_left).offset(-10);
    }];
    
    [_reduce mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.imageS.mas_centerY).offset(0);
        make.right.mas_equalTo(self.numbers.mas_left).offset(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];

}

//减少
- (void)reduceClick{
    NSInteger numberCount = [self.numbers.text integerValue];
    numberCount--;
    if (numberCount <=0) {
        return;
    }
    NSLog(@"%lu",numberCount);
    self.numbers.text = [NSString stringWithFormat:@"%ld",numberCount];
//    !_ReduceButton ? : _ReduceButton(numberCount);
}

// 增加
- (void)increaseClick{
    NSInteger numberCount = [self.numbers.text integerValue];
    numberCount++;
    self.numbers.text = [NSString stringWithFormat:@"%ld",numberCount];
//    !_IncreaseButton ? : _IncreaseButton(numberCount);
}





@end
