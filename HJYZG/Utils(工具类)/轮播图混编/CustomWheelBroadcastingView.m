//
//  CustomWheelBroadcastingView.m
//  HJYZG
//
//  Created by HCY on 2018/10/14.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "CustomWheelBroadcastingView.h"

@implementation CustomWheelBroadcastingView

- (void)reloadWheelBroadcasting:(NSArray *)imagesArray{
    self.dataArray = imagesArray;
    self.scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, self.frame.size.height)];
    self.scrollview.contentSize = CGSizeMake(imagesArray.count * self.frame.size.width , self.frame.size.height);
    self.scrollview.pagingEnabled=YES;//分页显示
    self.scrollview.showsHorizontalScrollIndicator=YES;//是否显示水平的指示灯
    self.scrollview.showsVerticalScrollIndicator=YES;//是否显示竖直的指示灯
    self.scrollview.indicatorStyle=UIScrollViewIndicatorStyleWhite;//指示灯样式
    self.scrollview.delegate=self;//设置代理
//    self.scrollview.contentMode = UIViewContentModeScaleAspectFill;
    self.scrollview.contentOffset = CGPointMake(0, 0);
    [self addSubview:self.scrollview];
    [imagesArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"%@,%lu",obj,(unsigned long)idx);
        
        
        if (idx == 0) {
//            self.videoCoverImageView = [[UIImageView alloc]initWithFrame:CGRectMake(idx * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
//
//
//        self.playButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"play" backgroundImageImage:@"" title:@"" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(playClick:)];
//            self.videoCoverImageView.backgroundColor = [UIColor cyanColor];
//            [self.scrollview addSubview:self.videoCoverImageView];
            
            XQVideoView *videoView = [XQVideoView videoViewFrame:self.scrollview.frame videoUrl:obj];
            [self.scrollview  addSubview:videoView];
            
            
        }else{
            UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(idx * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            image.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@", imagesArray[idx]]];
            [self.scrollview addSubview:image];
            
            UITapGestureRecognizer *sigleTapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
            sigleTapRecognizer.numberOfTapsRequired = 1;
            [self.scrollview addGestureRecognizer:sigleTapRecognizer];
        }
    }];
    
#pragma mark - 如果是视频，显示视频，图片，按钮
    self.videoButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"视频" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor orangeColor] addView:self target:self action:@selector(videoClick:)];
    self.videoButton.layer.cornerRadius = 8;
    
    self.pictureButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"" backgroundImageImage:@"" title:@"图片" titleColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:self target:self action:@selector(pictureClick:)];
    self.pictureButton.layer.cornerRadius = 8;

}


#pragma mark - 添加scrollview点击手势事件
- (void)handleTapGesture:(UITapGestureRecognizer *)tapRecognizer{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    !_GestureRecognizerBlock ? : _GestureRecognizerBlock(tapRecognizer);
}

#pragma mark - 设置约束

- (void)layoutSubviews{
    [super layoutSubviews];

    [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [_pictureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_centerX).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-30);
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    [_videoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_centerX).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-30);
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    
}

#pragma mark - 视频点击按钮

- (void)videoClick:(UIButton *)sender{
    self.videoButton.selected = YES;
    self.pictureButton.selected = NO;
    self.videoButton.backgroundColor = [UIColor orangeColor];
    self.pictureButton.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
    if ([self.scrollview.delegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
        
        [self.scrollview setContentOffset:CGPointMake(0, 0) animated:NO];
        [self scrollViewDidEndDecelerating:self.scrollview];
    }
}

#pragma mark - 图片点击按钮

- (void)pictureClick:(UIButton *)sender{
    self.videoButton.selected = NO;
    self.videoButton.selected = YES;
    self.videoButton.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
    self.videoButton.backgroundColor = [UIColor orangeColor];
    if (self.scrollview.contentOffset.x < self.frame.size.width) {
        if ([self.scrollview.delegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
            [self.scrollview setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
            [self scrollViewDidEndDecelerating:self.scrollview];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/self.bounds.size.width;
    self.scrollview.contentOffset = CGPointMake(index*self.bounds.size.width, 0);
    if (self.scrollview.contentOffset.x < self.frame.size.width) {
        [self.scrollview setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    else{
        self.scrollview.contentOffset = CGPointMake(scrollView.contentOffset.x/self.frame.size.width*self.frame.size.width, 0);
    }
}

#pragma mark - 播放视频按钮

- (void)playClick:(UIButton *)sender{
    NSLog(@"播放");
    !_playClickBlock ? : _playClickBlock(sender);
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scrollview.contentOffset.x < self.frame.size.width) {
        //        处理“视频”按钮
        self.videoButton.selected = YES;
        self.pictureButton.selected = NO;
        self.videoButton.backgroundColor = [UIColor orangeColor];
        self.pictureButton.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
        self.playButton.hidden =NO;
    }
    else{
        
        //        处理“图片”按钮
        self.videoButton.selected = NO;
        self.pictureButton.selected = YES;
        self.videoButton.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
        self.pictureButton.backgroundColor = [UIColor orangeColor];
        self.playButton.hidden =YES;
    }
}


@end
