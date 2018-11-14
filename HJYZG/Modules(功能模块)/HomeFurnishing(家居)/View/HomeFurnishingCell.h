//
//  HomeFurnishingCell.h
//  HJYZG
//
//  Created by HCY on 2018/8/14.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeFurnishingCell : UICollectionViewCell
@property (nonatomic, strong) PublicButton *iconImage;
@property (nonatomic, strong) PublicLabel *name;
@property(nonatomic,strong) void(^iconImageButton)(UIButton *sender);
@end
