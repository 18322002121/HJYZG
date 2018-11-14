//
//  ForgetPasswordCell.m
//  HJYZG
//
//  Created by HCY on 2018/11/8.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ForgetPasswordCell.h"

@implementation ForgetPasswordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.confirmChangeButton.layer.cornerRadius = 20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
