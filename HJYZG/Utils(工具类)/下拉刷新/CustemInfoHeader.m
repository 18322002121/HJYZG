//
//  CustemInfoHeader.m
//  自定义刷新控件
//
//  Created by HCY on 2018/10/2.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "CustemInfoHeader.h"

@interface CustemInfoHeader ()
@end

@implementation CustemInfoHeader

- (void)prepare
{
    [super prepare];
    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.hidden = YES;
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=27; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=27; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}



@end
