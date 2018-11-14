//
//  HomePageMainCell.m
//  HJYZG
//
//  Created by HCY on 2018/8/17.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HomePageMainCell.h"

@implementation HomePageMainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    NSArray *imageNames = @[@"h5.jpg",
                            @"h6.jpg",
                            @"h7.jpg",
                            @"h8.jpg",
                            @"h9.jpg",
                            @"h10.jpg",
                            ];
    // 本地加载图片的轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWidth, 150) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    [self addSubview:cycleScrollView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//分类按钮
- (IBAction)classifiedAreaClick:(id)sender {
    !_classifiedAreaButton ? : _classifiedAreaButton(sender);
}

//活动按钮
- (IBAction)activityClick:(id)sender {
    !_activityButton ? : _activityButton(sender);
}




@end
