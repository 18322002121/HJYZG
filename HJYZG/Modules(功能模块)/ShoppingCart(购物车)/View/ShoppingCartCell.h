//
//  ShoppingCartCell.h
//  HJYZG
//
//  Created by HCY on 2018/8/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCartCell : UITableViewCell

@property(nonatomic,strong)void (^SelectButtonButton)(UIButton *sender);

@property(nonatomic,strong)void (^IncreaseButton)(NSInteger sender);

@property(nonatomic,strong)void (^ReduceButton)(NSInteger sender);


/** 商品数量 */
@property (weak, nonatomic) IBOutlet UILabel *numberCount;
/** 商品图片 */
@property (weak, nonatomic) IBOutlet UIImageView *shopImage;
/** 商品描述 */
@property (weak, nonatomic) IBOutlet UILabel *shopDescribe;
/** 商品价格 */
@property (weak, nonatomic) IBOutlet UILabel *shopPrice;
/** 商品件数 */
@property (weak, nonatomic) IBOutlet UILabel *numberOfGoods;


@end
