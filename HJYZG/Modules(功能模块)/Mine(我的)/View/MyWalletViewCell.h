//
//  MyWalletViewCell.h
//  HJYZG
//
//  Created by HCY on 2018/10/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyWalletViewCell : UITableViewCell
/**  充值 */
@property (nonatomic,strong) void (^rechargeClick)(UIButton *sender);

/**  提现 */
@property (nonatomic,strong) void (^putForwardClick)(UIButton *sender);

@end
