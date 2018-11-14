//
//  CountDownTime.h
//  HJYZG
//
//  Created by HCY on 2018/8/28.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^antwice)(int countdown);
typedef void (^finish)(void);
@interface CountDownTime : NSObject

@property(nonatomic,strong)antwice antwiceCountDownBlock;
@property(nonatomic,strong)finish finishBlock;
-(void)createCountDown:(int)totalTime antwiceCountDownBlock:(antwice)antwiceCountDownBlock finishBlock:(finish)finishBlock;
+(void)CountDown:(int)totalTime antwiceCountDownBlock:(antwice)antwiceCountDownBlock finishBlock:(finish)finishBlock;
@end
