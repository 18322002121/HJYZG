//
//  GourmetTakeoutHeaderView.h
//  HJYZG
//
//  Created by HCY on 2018/10/6.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^reloadClick)(UIButton *sender);
@interface GourmetTakeoutHeaderView : UICollectionReusableView
@property (nonatomic,strong) reloadClick reloadButton;
@end
