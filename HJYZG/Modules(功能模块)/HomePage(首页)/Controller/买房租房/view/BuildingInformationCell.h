//
//  BuildingInformationCell.h
//  HJYZG
//
//  Created by HCY on 2018/9/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuildingInformationCell : UITableViewCell
/** 序号 */
@property (weak, nonatomic) IBOutlet UILabel *serialNumber;

/** 面积 */
@property (weak, nonatomic) IBOutlet UILabel *area;

/** 单价 */
@property (weak, nonatomic) IBOutlet UILabel *unitPrice;

/** 总价 */
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;

/** 状态 */
@property (weak, nonatomic) IBOutlet UILabel *state;




@end
