//
//  ReimbursementViewCell.h
//  HJYZG
//
//  Created by HCY on 2018/9/12.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReimbursementViewCell : UITableViewCell

/** 期数 */
@property (weak, nonatomic) IBOutlet UILabel *numberPeriods;
/** 月供本金 */
@property (weak, nonatomic) IBOutlet UILabel *principal;
/** 月供利息 */
@property (weak, nonatomic) IBOutlet UILabel *interest;
/** 月供 */
@property (weak, nonatomic) IBOutlet UILabel *monthlySupply;
/** 剩余贷款 */
@property (weak, nonatomic) IBOutlet UILabel *surplus;

@end
