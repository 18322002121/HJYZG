//
//  ResgisterCell.m
//  HJYZG
//
//  Created by HCY on 2018/11/6.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ResgisterCell.h"

@implementation ResgisterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.registerButton.layer.cornerRadius = 20;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//验证用户名
- (IBAction)changeUsername:(UITextField *)sender {
    if ([sender.text isEqualToString:@""]) {
        return;
    }
    self.username = sender.text;
    [HCYRequestManager appCheckNameUsername:sender.text success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] == 200) {
            if ([responseObject[@"data"][@"status"]integerValue] == 1) {
                [YJProgressHUD showMsgWithoutView:responseObject[@"msg"]];
            }
        }
    } failure:^(NSError *errorMessage) {
        [YJProgressHUD showMsgWithoutView:@"请求超时"];
    }];
}

//验证手机号
- (IBAction)appCheckMobiles:(UITextField *)sender {
    if ([sender.text isEqualToString:@""]) {
        return;
    }
    if ([ResgisterCell valiMobile:sender.text] == YES) {
        self.mobile = sender.text;
    }else{
        [YJProgressHUD showMsgWithoutView:@"手机号码格式不正确"];
    }
    
    [HCYRequestManager appCheckMobileMobile:sender.text success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] == 200) {
            if ([responseObject[@"data"][@"status"]integerValue] == 1) {
                [YJProgressHUD showMsgWithoutView:responseObject[@"msg"]];
            }
        }
    } failure:^(NSError *errorMessage) {
        [YJProgressHUD showMsgWithoutView:@"请求超时"];
    }];
}

//判断手机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" "withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}


//验证邮箱
- (IBAction)appCheckEmails:(UITextField *)sender {
    if ([sender.text isEqualToString:@""]) {
        return;
    }
    self.email = sender.text;
    [HCYRequestManager appCheckMobileMobile:sender.text success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] == 200) {
            if ([responseObject[@"data"][@"status"]integerValue] == 1) {
                [YJProgressHUD showMsgWithoutView:responseObject[@"msg"]];
            }
        }
    } failure:^(NSError *errorMessage) {
        [YJProgressHUD showMsgWithoutView:@"请求超时"];
    }];
}

//验证密码
- (IBAction)appRegisterMethods:(UITextField *)sender {
    if ([sender.text isEqualToString:@""]) {
        return;
    }
    self.password = sender.text;
    [HCYRequestManager appCheckMobileMobile:sender.text success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] == 200) {
            if ([responseObject[@"data"][@"status"]integerValue] == 1) {
                [YJProgressHUD showMsgWithoutView:responseObject[@"msg"]];
            }
        }
    } failure:^(NSError *errorMessage) {
        [YJProgressHUD showMsgWithoutView:@"请求超时"];
    }];
}

//验证注册
- (IBAction)registerButton:(UIButton *)sender {
    [HCYRequestManager appRegisterMethodUsername:self.username password:self.password email:self.email mobile:self.mobile success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        if ([responseObject[@"code"] integerValue] == 200) {
            if ([responseObject[@"data"][@"status"]integerValue] == 1) {
                [YJProgressHUD showMsgWithoutView:responseObject[@"msg"]];
            }else{
                [YJProgressHUD showMsgWithoutView:responseObject[@"msg"]];
            }
        }
    } failure:^(NSError *errorMessage) {
        NSLog(@"%@",errorMessage);
    }];
}




@end
