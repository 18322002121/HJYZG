//
//  PublicButton.m
//  HJYZG
//
//  Created by HCY on 2018/8/8.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "PublicButton.h"
@interface PublicButton()
@property (nonatomic, assign) UIButtonEdgeInsetsStyle btnStyle;

@end
@implementation PublicButton

+(PublicButton *)buttonWithFrame:(CGRect)frame
                           image:(NSString *)image
            backgroundImageImage:(NSString *)backgroundImageimage
                           title:(NSString *)title
                      titleColor:(UIColor *)titleColor
                        textFont:(UIFont *)font
                 backgroundColor:(UIColor *)backgroundColor
                         addView:(UIView *)view
                          target:(id)target
                          action:(SEL)action
{
    PublicButton *btn = [[PublicButton alloc] init];
    btn.frame = frame;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:backgroundImageimage] forState:UIControlStateNormal];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    return btn;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    CGRect titleFrame = self.titleLabel.frame;
    CGRect imageFrame = self.imageView.frame;
    CGFloat spacing = 0;
    
    if (self.btnStyle == UIButtonEdgeInsetsStyleTop || self.btnStyle == UIButtonEdgeInsetsStyleBottom) {
        spacing = (self.frame.size.height - titleFrame.size.height - imageFrame.size.height - 5) / 2;
    } else {
        spacing = (self.frame.size.width - titleFrame.size.width - imageFrame.size.width - 5) / 2;
    }
    
    switch (self.btnStyle) {
        case UIButtonEdgeInsetsStyleTop:
        {
            self.imageView.center = CGPointMake(self.frame.size.width / 2, spacing + imageFrame.size.height / 2);
            self.titleLabel.center = CGPointMake(self.frame.size.width / 2, CGRectGetMaxY(self.imageView.frame) + titleFrame.size.height / 2 + 5);
        }
            break;
        case UIButtonEdgeInsetsStyleBottom:
        {
            self.titleLabel.center = CGPointMake(self.frame.size.width / 2, spacing + titleFrame.size.height / 2);
            self.imageView.center = CGPointMake(self.frame.size.width / 2, CGRectGetMaxY(self.titleLabel.frame) + imageFrame.size.height / 2 + 5);
        }
            break;
        case UIButtonEdgeInsetsStyleLeft:
        {
            self.imageView.center = CGPointMake(spacing + imageFrame.size.width / 2, self.frame.size.height / 2);
            self.titleLabel.center = CGPointMake(CGRectGetMaxX(self.imageView.frame) + 5 + titleFrame.size.width / 2, self.frame.size.height / 2);
        }
            break;
        case UIButtonEdgeInsetsStyleRight:
        {
            self.titleLabel.center = CGPointMake(spacing + titleFrame.size.width / 2, self.frame.size.height / 2);
            self.imageView.center = CGPointMake(CGRectGetMaxX(self.titleLabel.frame) + 5 + imageFrame.size.width / 2, self.frame.size.height / 2);
        }
            break;
        default:
            break;
    }
}

+ (PublicButton *)buttonWithFrame:(CGRect)frame buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyle)buttonEdgeInsetsStyle image:(NSString *)image backgroundImageImage:(NSString *)backgroundImageimage title:(NSString *)title titleColor:(UIColor *)titleColor textFont:(UIFont *)font backgroundColor:(UIColor *)backgroundColor addView:(UIView *)view target:(id)target action:(SEL)action{
    PublicButton *btn = [[PublicButton alloc] init];
    btn.frame = frame;
    btn.btnStyle=buttonEdgeInsetsStyle;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:backgroundImageimage] forState:UIControlStateNormal];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    return btn;
}

@end
