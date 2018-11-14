//
//  ReimbursementFixedHeaderView.h
//  HJYZG
//
//  Created by HCY on 2018/9/12.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReimbursementFixedHeaderView : UIView
/**  贷款总额 */
@property (weak, nonatomic) IBOutlet UILabel *totalLoan;

/**  支付利息 */
@property (weak, nonatomic) IBOutlet UILabel *paymentInterest;

/**  还款总额 */
@property (weak, nonatomic) IBOutlet UILabel *totalRepayment;

/**  按钮背景 */
@property (weak, nonatomic) IBOutlet UIView *buttonBackView;

@end
