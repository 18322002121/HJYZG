//
//  BuyHouseTableViewCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "BuyHouseTableViewCell.h"

@implementation BuyHouseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.houseImage.backgroundColor=kRandomColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
