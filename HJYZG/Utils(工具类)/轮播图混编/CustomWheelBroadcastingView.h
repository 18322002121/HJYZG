//
//  CustomWheelBroadcastingView.h
//  HJYZG
//
//  Created by HCY on 2018/10/14.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomWheelBroadcastingView : UIView<UIScrollViewDelegate>

/** 滚动视图*/
@property (nonatomic,strong) UIScrollView *scrollview;
/** 视频按钮 */
@property (nonatomic,strong) PublicButton *videoButton;
/** 图片按钮 */
@property (nonatomic,strong) PublicButton *pictureButton;
/** 图片、视频，数组 */
@property (nonatomic,strong) NSArray *dataArray;
/** 是否有视频 */
@property (nonatomic,assign) BOOL *isVideo;
/** 视频播放按钮 */
@property (nonatomic,strong) UIButton *playButton;
/** 视频封面视图 */
@property (nonatomic,strong) UIImageView *videoCoverImageView;

//方法
- (void)reloadWheelBroadcasting:(NSArray *)imagesArray;

@property (nonatomic,strong) void (^playClickBlock)(UIButton *sender);

@property (nonatomic,strong) void (^GestureRecognizerBlock)(UITapGestureRecognizer *tapRecognizer);

@end
