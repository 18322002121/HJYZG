//
//  NewReceiptAddressCell.m
//  HJYZG
//
//  Created by HCY on 2018/9/3.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "NewReceiptAddressCell.h"

@implementation NewReceiptAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



//选中按钮
- (IBAction)selectAddress:(id)sender {
    !_selectAddressButton ? : _selectAddressButton(sender);
}

//保存并使用
- (IBAction)saveAndUse:(id)sender {
    !_saveAndUseButton ? : _saveAndUseButton(sender);
}

//选择省市区
- (IBAction)provincialUrbanArea:(id)sender {
    !_provincialUrbanAreaButton ? : _provincialUrbanAreaButton(sender);
}



@end
