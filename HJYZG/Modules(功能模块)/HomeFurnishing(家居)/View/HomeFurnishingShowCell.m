//
//  HomeFurnishingShowCell.m
//  HJYZG
//
//  Created by HCY on 2018/8/27.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HomeFurnishingShowCell.h"

@interface HomeFurnishingShowCell ()
@property (weak, nonatomic) IBOutlet UIImageView *images;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation HomeFurnishingShowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setShop:(HomeFurnishingShowModel *)shop{
    
    _shop = shop;
    
    // 图片
//    [self.images sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];
    
    // 价格
//    self.priceLabel.text = shop.price;
}



@end
