//
//  PublicButton.h
//  HJYZG
//
//  Created by HCY on 2018/8/8.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  NS_ENUM(NSInteger,UIButtonEdgeInsetsStyle){
    UIButtonEdgeInsetsStyleNormal,
    UIButtonEdgeInsetsStyleLeft,
    UIButtonEdgeInsetsStyleRight,
    UIButtonEdgeInsetsStyleTop,
    UIButtonEdgeInsetsStyleBottom
};
@interface PublicButton : UIButton

+ (PublicButton *)buttonWithFrame:(CGRect)frame
                           image:(NSString *)image
            backgroundImageImage:(NSString *)backgroundImageimage
                           title:(NSString *)title
                      titleColor:(UIColor *)titleColor
                        textFont:(UIFont *)font
                 backgroundColor:(UIColor *)backgroundColor
                         addView:(UIView *)view
                          target:(id)target
                          action:(SEL)action;

/** 可自由定制button */
+ (PublicButton *)buttonWithFrame:(CGRect)frame buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyle)buttonEdgeInsetsStyle image:(NSString *)image backgroundImageImage:(NSString *)backgroundImageimage title:(NSString *)title titleColor:(UIColor *)titleColor textFont:(UIFont *)font backgroundColor:(UIColor *)backgroundColor addView:(UIView *)view target:(id)target action:(SEL)action;

@end
