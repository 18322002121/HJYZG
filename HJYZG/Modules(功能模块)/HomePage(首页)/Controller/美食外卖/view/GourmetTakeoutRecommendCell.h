//
//  GourmetTakeoutRecommendCell.h
//  HJYZG
//
//  Created by HCY on 2018/10/5.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^didSelectItemClick)(NSIndexPath *indexPath);
@interface GourmetTakeoutRecommendCell : UICollectionViewCell
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) didSelectItemClick didSelectItemClickButton;
@end
