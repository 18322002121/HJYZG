//
//  ANewHouseViewCell.m
//  HJYZG
//
//  Created by HCY on 2018/10/3.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ANewHouseViewCell.h"
#import "CustomWheelBroadcastingView.h"

@interface ANewHouseViewCell ()<SDCycleScrollViewDelegate>
@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic,strong) NSArray *localImages;
@property (nonatomic,strong) PublicButton *vedioButton;
@property (nonatomic,strong) PublicButton *imageButton;

@end

@implementation ANewHouseViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self ScrollLocalImages];
    [self addShadowToView:self.backView withColor:[UIColor blackColor]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 地图定位

- (IBAction)mapPositioningClick:(id)sender {
    !_mapPositioningButton ? : _mapPositioningButton(sender);
}

#pragma mark - 更多信息

- (IBAction)moreInformationClick:(id)sender {
    !_moreInformationButton ? : _moreInformationButton(sender);
}

#pragma mark - 五证齐全

- (IBAction)completeFiveEvidenceClick:(id)sender {
    !_completeFiveEvidenceButton ? : _completeFiveEvidenceButton(sender);
}

#pragma mark - 开盘通知

- (IBAction)openingNoticeClick:(id)sender {
    !_openingNoticeButton ? : _openingNoticeButton(sender);
}

#pragma mark - 免费致电

- (IBAction)freeCallClick:(id)sender {
    !_freeCallButton ? : _freeCallButton(sender);
}

-(void)ScrollLocalImages{
    CustomWheelBroadcastingView *customView = [[CustomWheelBroadcastingView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, self.bannerView.frame.size.height)];
    [customView reloadWheelBroadcasting:@[@"http://221.228.226.5/15/t/s/h/v/tshvhsxwkbjlipfohhamjkraxuknsc/sh.yinyuetai.com/88DC015DB03C829C2126EEBBB5A887CB.mp4",@"jiaju1",@"jiaju2",@"jiaju3",@"jiaju4",@"jiaju5",@"jiaju6",@"jiaju7",@"jiaju8"]];
    [self.bannerView addSubview:customView];
    
    customView.GestureRecognizerBlock = ^(UITapGestureRecognizer *tapRecognizer) {
        !self.aNewHouseSelectIndex ? : self.aNewHouseSelectIndex(tapRecognizer);
    };
}

// 添加四边阴影效果
- (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor {
    // 阴影颜色
    theView.layer.shadowColor = theColor.CGColor;
    // 阴影偏移，默认(0, -3)
    theView.layer.shadowOffset = CGSizeMake(0,0);
    // 阴影透明度，默认0
    theView.layer.shadowOpacity = 0.5;
    // 阴影半径，默认3
    theView.layer.shadowRadius = 5;
}

//- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
//    NSLog(@"banner图点击事件");
//    !_aNewHouseSelectIndex ? : _aNewHouseSelectIndex(index);
//}


@end
