//
//  PublicTextfield.m
//  HJYZG
//
//  Created by HCY on 2018/8/11.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "PublicTextfield.h"

@implementation PublicTextfield

+(PublicTextfield *)textFieldWithFrame:(CGRect )frame
                            background:(UIImage *)image
                       secureTextEntry:(BOOL)secureTextEntry
                           placeholder:(NSString *)str
                  clearsOnBeginEditing:(BOOL)clearsOnBeginEditing
{
    PublicTextfield *textField = [[PublicTextfield alloc]init];
    textField.frame = frame ;
    textField.background = image ;
    textField.secureTextEntry =secureTextEntry;
    textField.placeholder = str;
    textField.clearsOnBeginEditing =clearsOnBeginEditing;
    return textField;
}

@end
