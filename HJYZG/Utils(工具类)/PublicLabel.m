//
//  PublicLabel.m
//  HJYZG
//
//  Created by HCY on 2018/8/11.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "PublicLabel.h"

@implementation PublicLabel

+(PublicLabel *)labelWithFrame:(CGRect)frame
                          text:(NSString *)text
                     textColor:(UIColor *)textColor
                          font:(UIFont *)font
                 textAlignment:(NSTextAlignment)textAlignment
               backgroundColor:(UIColor *)backgroundColor
{
    PublicLabel *label=[[PublicLabel alloc]init];
    label.frame=frame;
    label.text=text;
    label.textColor=textColor;
    label.font=font;
    label.textAlignment=textAlignment;
    label.backgroundColor=backgroundColor;
    return label;
}

@end
