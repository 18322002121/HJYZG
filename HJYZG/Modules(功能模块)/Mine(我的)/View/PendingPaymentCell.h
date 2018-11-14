//
//  PendingPaymentCell.h
//  HJYZG
//
//  Created by HCY on 2018/8/16.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PendingPaymentCell : UITableViewCell
@property(nonatomic,strong)void(^callPhoneButton)(UIButton *sender);
@property(nonatomic,strong)void(^cancellationOfOrderButton)(UIButton *sender);
@property(nonatomic,strong)void(^immediatePaymentButton)(UIButton *sender);
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;

@end
