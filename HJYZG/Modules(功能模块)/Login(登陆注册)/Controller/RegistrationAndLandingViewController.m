//
//  RegistrationAndLandingViewController.m
//  HJYZG
//
//  Created by HCY on 2018/11/6.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "RegistrationAndLandingViewController.h"
#import "LoginViewController.h"
#import "ResgisterViewController.h"

@interface RegistrationAndLandingViewController ()
@property (nonatomic, strong) ZWMSegmentController *segmentVC;
@end

@implementation RegistrationAndLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"登陆";
    [self reloadScrollviewSegment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建头部滚动条
- (void)reloadScrollviewSegment{
    self.navigationController.navigationBar.translucent = NO;
    
    LoginViewController *f = [[LoginViewController alloc] init];
    ResgisterViewController *s = [[ResgisterViewController alloc] init];
    NSArray *array = @[f,s];
    
    self.segmentVC = [[ZWMSegmentController alloc] initWithFrame:self.view.bounds titles:@[@"登陆",@"注册"]];
    self.segmentVC.segmentView.showSeparateLine = YES;
    self.segmentVC.segmentView.segmentTintColor = [UIColor colorWithRed:0.26 green:0.26 blue:0.26 alpha:1.00];
    self.segmentVC.viewControllers = [array copy];
    self.segmentVC.segmentView.style=ZWMSegmentStyleDefault;
    [self addSegmentController:self.segmentVC];
    [self.segmentVC  setSelectedAtIndex:0];
}


@end
