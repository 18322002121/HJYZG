//
//  LoginCell.m
//  HJYZG
//
//  Created by HCY on 2018/8/10.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "LoginCell.h"

@implementation LoginCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


// 注册按钮
- (IBAction)resgisterClick:(id)sender {
    !_resgisterButton ? : _resgisterButton(sender);
}

// 忘记密码按钮
- (IBAction)forgetPasswordClick:(id)sender {
    !_forgetPasswordButton ? : _forgetPasswordButton(sender);
}

// 登陆按钮
- (IBAction)loginClick:(id)sender {
    !_loginButton ? : _loginButton(sender);
}








@end
