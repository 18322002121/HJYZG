//
//  AppDelegate.h
//  HJYZG
//
//  Created by HCY on 2018/8/7.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *appKey = @"76b91f9d847d2e97546be7e6";
static NSString *channel = @"ff3bd61c30b3e4a3d7258dc2";
static BOOL isProduction = FALSE;
#define BMK_KEY @"wMAsA1BCDZBdEPg7z2pFRlkRHrZt6SbD"//百度地图的key

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) BMKMapManager *mapManager;


@end

