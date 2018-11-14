//
//  ShoppingCartHeaderView.m
//  HJYZG
//
//  Created by HCY on 2018/9/9.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ShoppingCartHeaderView.h"

@implementation ShoppingCartHeaderView

//商店名称
- (IBAction)shopClick:(UIButton *)sender {
    !_buttonClick ? : _buttonClick(sender);
}
//选中与取消
- (IBAction)shopImageClick:(id)sender {
    UIButton *senderButton=sender;
    senderButton.selected=!senderButton.selected;
    if (senderButton.selected) {
        [senderButton setImage:[UIImage imageNamed:@"box_unchoose"] forState:UIControlStateNormal];
    }else{
        [senderButton setImage:[UIImage imageNamed:@"box_choose"] forState:UIControlStateNormal];
    }
    !_shopImageButton ? : _shopImageButton(sender);
}

@end
