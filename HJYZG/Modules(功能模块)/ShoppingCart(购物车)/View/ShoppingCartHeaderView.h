//
//  ShoppingCartHeaderView.h
//  HJYZG
//
//  Created by HCY on 2018/9/9.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^shopClick)(UIButton *sender);
typedef void (^shopImageClick)(UIButton *sender);
@interface ShoppingCartHeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong) shopClick buttonClick;
@property (nonatomic,strong) shopImageClick shopImageButton;

@end
