//
//  CustemButton.m
//  HJYZG
//
//  Created by HCY on 2018/8/8.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "CustemButton.h"
//设置 自定义按钮的image与title在整个按钮中的比例
//image 0.7
//title 0.3
static CGFloat  kScale = 0.7;
@implementation CustemButton

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat width = contentRect.size.width;
    CGFloat height = contentRect.size.height * kScale;
    
    return CGRectMake(X, Y, width, height);
    
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat X = 0;
    CGFloat Y = contentRect.size.height * kScale;
    CGFloat width = contentRect.size.width;
    CGFloat height = contentRect.size.height * (1 - kScale);
    
    return CGRectMake(X, Y, width, height);
    
}
@end
