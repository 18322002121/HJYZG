//
//  PublicWaterFallLayout.h
//  HJYZG
//
//  Created by HCY on 2018/8/27.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PublicWaterFallLayout;

@protocol  PublicWaterFallLayoutDeleaget<NSObject>

@required
/**
 * 每个item的高度
 */
- (CGFloat)waterFallLayout:(PublicWaterFallLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth;

@optional
/**
 * 有多少列
 */
- (NSUInteger)columnCountInWaterFallLayout:(PublicWaterFallLayout *)waterFallLayout;

/**
 * 每列之间的间距
 */
- (CGFloat)columnMarginInWaterFallLayout:(PublicWaterFallLayout *)waterFallLayout;

/**
 * 每行之间的间距
 */
- (CGFloat)rowMarginInWaterFallLayout:(PublicWaterFallLayout *)waterFallLayout;

/**
 * 每个item的内边距
 */
- (UIEdgeInsets)edgeInsetdInWaterFallLayout:(PublicWaterFallLayout *)waterFallLayout;


@end
@interface PublicWaterFallLayout : UICollectionViewLayout
/** 代理 */
@property (nonatomic, weak) id<PublicWaterFallLayoutDeleaget> delegate;
@end
