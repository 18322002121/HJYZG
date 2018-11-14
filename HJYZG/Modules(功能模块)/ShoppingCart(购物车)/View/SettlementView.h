//
//  SettlementView.h
//  HJYZG
//
//  Created by HCY on 2018/8/16.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettlementView : UIView

@property(nonatomic,strong)PublicButton *selectClick;
@property(nonatomic,strong)PublicLabel *allSelectLabel;
@property(nonatomic,strong)PublicLabel *totalPriceLabel;
@property(nonatomic,strong)PublicLabel *totalPrice;
@property(nonatomic,strong)PublicButton *settlement;

@property(nonatomic,strong)void(^settlementButton)(UIButton *sender);
@property(nonatomic,strong)void(^selectButton)(UIButton *sender);
@end
