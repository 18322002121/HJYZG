//
//  NewReceiptAddressCell.h
//  HJYZG
//
//  Created by HCY on 2018/9/3.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewReceiptAddressCell : UITableViewCell

/** 设置默认地址按钮 */
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

/** 收货人 */
@property (weak, nonatomic) IBOutlet UITextField *consigneeTextfield;

/** 手机号码 */
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextfield;

/** 详细地址 */
@property (weak, nonatomic) IBOutlet UITextField *addressTextfield;

/** 选择省市区按钮 */
@property (weak, nonatomic) IBOutlet UIButton *provincialUrbanAreaClick;

/** 保存按钮 */
@property (weak, nonatomic) IBOutlet UIButton *saveClick;

/** 省市区选择label */
@property (weak, nonatomic) IBOutlet UILabel *provincialUrbanAreaLabel;


@property(nonatomic,strong)void (^selectAddressButton)(UIButton *sender);
@property(nonatomic,strong)void (^saveAndUseButton)(UIButton *sender);
@property(nonatomic,strong)void (^provincialUrbanAreaButton)(UIButton *sender);
@end
