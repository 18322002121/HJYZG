//
//  PublicLabel.h
//  HJYZG
//
//  Created by HCY on 2018/8/11.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicLabel : UILabel

+(PublicLabel *)labelWithFrame:(CGRect)frame
                          text:(NSString *)text
                     textColor:(UIColor *)textColor
                          font:(UIFont *)font
                 textAlignment:(NSTextAlignment)textAlignment
               backgroundColor:(UIColor *)bgColor;

@end
