//
//  GourmetTakeoutHeaderViewNormal.m
//  HJYZG
//
//  Created by HCY on 2018/10/10.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "GourmetTakeoutHeaderViewNormal.h"
@interface GourmetTakeoutHeaderViewNormal ()
@property (nonatomic,strong) PublicLabel *titleLabel;
@end
@implementation GourmetTakeoutHeaderViewNormal

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _titleLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"为你推荐:" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
        [self addSubview:_titleLabel];
        
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(10);
    }];
    
}

@end
