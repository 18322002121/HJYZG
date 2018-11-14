//
//  PendingPaymentCell.m
//  HJYZG
//
//  Created by HCY on 2018/8/16.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "PendingPaymentCell.h"

@implementation PendingPaymentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//打电话
- (IBAction)callPhoneClick:(id)sender {
    !_callPhoneButton ? : _callPhoneButton(sender);
}



//取消订单
- (IBAction)cancellationOfOrderClick:(id)sender {
    !_cancellationOfOrderButton ? : _cancellationOfOrderButton(sender);
}


//立即支付
- (IBAction)immediatePaymentClick:(id)sender {
    !_immediatePaymentButton ? : _immediatePaymentButton(sender);
}






@end
