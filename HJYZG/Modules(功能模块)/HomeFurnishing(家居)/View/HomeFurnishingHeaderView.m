//
//  HomeFurnishingHeaderView.m
//  HJYZG
//
//  Created by HCY on 2018/8/14.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HomeFurnishingHeaderView.h"

@implementation HomeFurnishingHeaderView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.title=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"章鱼" textColor:[UIColor redColor] font:[UIFont systemFontOfSize:15.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor greenColor]];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(2);
        make.left.mas_equalTo(self.mas_left).offset(2);
        make.right.mas_equalTo(self.mas_right).offset(-2);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-2);
    }];
}



@end
