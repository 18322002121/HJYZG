//
//  PersonalTableViewCell.h
//  HJYZG
//
//  Created by HCY on 2018/8/9.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalTableViewCell : UITableViewCell
/** 查看全部订单 */
@property(nonatomic,strong)void (^viewAllOrdersButton)(UIButton *sender);
/** 待付款 */
@property(nonatomic,strong)void (^pendingPaymentButton)(UIButton *sender);
/** 待发货 */
@property(nonatomic,strong)void (^pendingDeliveryButton)(UIButton *sender);
/** 待收货 */
@property(nonatomic,strong)void (^goodsToBeReceivedButton)(UIButton *sender);
/** 待评价 */
@property(nonatomic,strong)void (^toBeEvaluatedButton)(UIButton *sender);
/** 认购单 */
@property(nonatomic,strong)void (^subscriptionFormButton)(UIButton *sender);
/** 个人资料 */
@property(nonatomic,strong)void (^PersonalDataButton)(UIButton *sender);
/** 收货地址 */
@property(nonatomic,strong)void (^ReceivingAddressButton)(UIButton *sender);
/** 安全设置 */
@property(nonatomic,strong)void (^SecuritySettingButton)(UIButton *sender);
/** 我的钱包 */
@property(nonatomic,strong)void (^MyWalletButton)(UIButton *sender);
/** 我的分期 */
@property(nonatomic,strong)void (^MyStagingButton)(UIButton *sender);
/** 卡劵包 */
@property(nonatomic,strong)void (^VoucherButton)(UIButton *sender);
/** 绑物业费 */
@property(nonatomic,strong)void (^PropertyFeeButton)(UIButton *sender);
/** 客服中心 */
@property(nonatomic,strong)void (^CustomerServiceCenterButton)(UIButton *sender);
/** 安全退出 */
@property(nonatomic,strong)void (^SafeExitButton)(UIButton *sender);
/** 房贷计算器 */
@property(nonatomic,strong)void (^mortgageCalculator)(UIButton *sender);

@end
