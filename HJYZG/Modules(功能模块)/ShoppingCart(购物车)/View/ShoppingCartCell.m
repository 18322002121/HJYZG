//
//  ShoppingCartCell.m
//  HJYZG
//
//  Created by HCY on 2018/8/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ShoppingCartCell.h"

@implementation ShoppingCartCell


- (void)awakeFromNib {
    [super awakeFromNib];
    self.shopImage.backgroundColor = kRandomColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

//选中按钮
- (IBAction)selectButtonClick:(id)sender {
    
    UIButton *senderButton=sender;
    senderButton.selected=!senderButton.selected;
    if (senderButton.selected) {
        [senderButton setImage:[UIImage imageNamed:@"box_unchoose"] forState:UIControlStateNormal];
    }else{
        [senderButton setImage:[UIImage imageNamed:@"box_choose"] forState:UIControlStateNormal];
    }
    !_SelectButtonButton ? : _SelectButtonButton(sender);
    
}

//增加
- (IBAction)increaseClick:(id)sender {
    NSInteger numberCount = [self.numberCount.text integerValue];
    numberCount++;
    self.numberOfGoods.text = [NSString stringWithFormat:@"%ld",numberCount];
    !_IncreaseButton ? : _IncreaseButton(numberCount);
}

//减少
- (IBAction)reduceClick:(id)sender {
    NSInteger numberCount = [self.numberCount.text integerValue];
    numberCount--;
    if (numberCount <=0) {
        return;
    }
    NSLog(@"%lu",numberCount);
    self.numberOfGoods.text = [NSString stringWithFormat:@"%ld",numberCount];
    !_ReduceButton ? : _ReduceButton(numberCount);
}


@end
