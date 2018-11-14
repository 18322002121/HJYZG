//
//  ANewHouseViewCell.h
//  HJYZG
//
//  Created by HCY on 2018/10/3.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^mapPositioningClick)(UIButton *sender);
typedef void (^moreInformationClick)(UIButton *sender);
typedef void (^completeFiveEvidenceClick)(UIButton *sender);
typedef void (^openingNoticeClick)(UIButton *sender);
typedef void (^freeCallClick)(UIButton *sender);
@interface ANewHouseViewCell : UITableViewCell
@property (nonatomic,strong) mapPositioningClick mapPositioningButton;
@property (nonatomic,strong) moreInformationClick moreInformationButton;
@property (nonatomic,strong) completeFiveEvidenceClick completeFiveEvidenceButton;
@property (nonatomic,strong) openingNoticeClick openingNoticeButton;
@property (nonatomic,strong) freeCallClick freeCallButton;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (nonatomic,strong) void (^aNewHouseSelectIndex)(UITapGestureRecognizer *taps);

@end
