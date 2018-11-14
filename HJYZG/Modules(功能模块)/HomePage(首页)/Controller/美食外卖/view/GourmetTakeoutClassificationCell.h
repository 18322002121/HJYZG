//
//  GourmetTakeoutClassificationCell.h
//  HJYZG
//
//  Created by HCY on 2018/10/6.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^BusinessListItemAtIndexPath)(NSIndexPath *indexPath);
@interface GourmetTakeoutClassificationCell : UICollectionViewCell
@property (nonatomic,strong) BusinessListItemAtIndexPath businessListIndexPath;
@end
