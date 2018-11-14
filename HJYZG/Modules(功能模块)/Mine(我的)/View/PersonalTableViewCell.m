//
//  PersonalTableViewCell.m
//  HJYZG
//
//  Created by HCY on 2018/8/9.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "PersonalTableViewCell.h"

@implementation PersonalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//查看全部订单
- (IBAction)viewAllOrdersClick:(id)sender {
    !_viewAllOrdersButton ? : _viewAllOrdersButton(sender);
}

//待付款
- (IBAction)pendingPaymentClick:(id)sender {
    !_pendingPaymentButton ? : _pendingPaymentButton(sender);
}

//待发货
- (IBAction)pendingDeliveryClick:(id)sender {
    !_pendingDeliveryButton ? : _pendingDeliveryButton(sender);
}

//待收货
- (IBAction)goodsToBeReceivedClick:(id)sender {
    !_goodsToBeReceivedButton ? : _goodsToBeReceivedButton(sender);
}

//待评价
- (IBAction)toBeEvaluatedClick:(id)sender {
    !_toBeEvaluatedButton ? : _toBeEvaluatedButton(sender);
}

//认购单
- (IBAction)subscriptionFormClick:(id)sender {
    !_subscriptionFormButton ? : _subscriptionFormButton(sender);
}

//个人资料
- (IBAction)personalDataClick:(id)sender {
    !_PersonalDataButton ? : _PersonalDataButton(sender);
}

//收货地址
- (IBAction)receivingAddressClick:(id)sender {
    !_ReceivingAddressButton ? : _ReceivingAddressButton(sender);
}

//安全设置
- (IBAction)securitySettingClick:(id)sender {
    !_SecuritySettingButton ? : _SecuritySettingButton(sender);
}

//我的钱包
- (IBAction)myWalletClick:(id)sender {
    !_MyWalletButton ? : _MyWalletButton(sender);
}

//我的分期
- (IBAction)myStagingClick:(id)sender {
    !_MyStagingButton ? : _MyStagingButton(sender);
}

//卡劵包
- (IBAction)voucherClick:(id)sender {
    !_VoucherButton ? : _VoucherButton(sender);
}

//绑物业费
- (IBAction)propertyFeeClick:(id)sender {
    !_PropertyFeeButton ? : _PropertyFeeButton(sender);
}

//客服中心
- (IBAction)customerServiceCenterClick:(id)sender {
    !_CustomerServiceCenterButton ? : _CustomerServiceCenterButton(sender);
}

//安全退出 
- (IBAction)safeExitClick:(id)sender {
    !_SafeExitButton ? : _SafeExitButton(sender);
}

//房贷计算器
- (IBAction)mortgageCalculator:(id)sender {
    !_mortgageCalculator ? : _mortgageCalculator(sender);
}

@end
