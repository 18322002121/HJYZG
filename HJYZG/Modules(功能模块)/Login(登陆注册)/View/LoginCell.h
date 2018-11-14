//
//  LoginCell.h
//  HJYZG
//
//  Created by HCY on 2018/8/10.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^resgisterClick)(UIButton *sender);
typedef void (^forgetPasswordClick)(UIButton *sender);
typedef void (^loginClick)(UIButton *sender);
@interface LoginCell : UITableViewCell
/** 注册block */
@property(nonatomic,strong)resgisterClick resgisterButton;

/** 忘记密码block */
@property(nonatomic,strong)forgetPasswordClick forgetPasswordButton;

/** 登陆block */
@property(nonatomic,strong)loginClick loginButton;

/** 用户名 */
@property (weak, nonatomic) IBOutlet UITextField *username;

/** 密码 */
@property (weak, nonatomic) IBOutlet UITextField *password;


@end
