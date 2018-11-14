//
//  ResgisterCell.h
//  HJYZG
//
//  Created by HCY on 2018/11/6.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResgisterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
/** 用户名 */
@property (nonatomic,strong) NSString *username;

/** 手机号 */
@property (nonatomic,strong) NSString *mobile;

/** email */
@property (nonatomic,strong) NSString *email;

/** 密码 */
@property (nonatomic,strong) NSString *password;

/** 提交 */
@property (nonatomic,strong) NSString *registerSubmit;

@end
