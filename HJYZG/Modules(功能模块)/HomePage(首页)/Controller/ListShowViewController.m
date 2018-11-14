//
//  ListShowViewController.m
//  HJYZG
//
//  Created by HCY on 2018/9/3.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ListShowViewController.h"

@interface ListShowViewController ()

@end

@implementation ListShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];
    UIView *showView =[[UIView alloc]init];
    showView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:showView];
    [showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.centerY.mas_equalTo(self.view.mas_centerY).offset(0);
        make.height.mas_offset(KScreenWidth-40);
    }];
    
    PublicButton *cancelButton=[PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"取消" backgroundImageImage:@"" title:@"" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:self.view target:self action:@selector(cancelClick)];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(showView.mas_top).offset(0);
        make.right.mas_equalTo(showView.mas_right).offset(0);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    PublicLabel *titleLabel=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"户二维表" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [showView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(showView.mas_left).offset(20);
        make.top.mas_equalTo(showView.mas_top).offset(10);
    }];
    
    PublicLabel *themeLabel=[PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"存量状态" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [showView addSubview:themeLabel];
    
    [themeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(showView.mas_top).offset(40);
        make.centerX.mas_equalTo(showView.mas_centerX).offset(0);
    }];
    
    
    
}

- (void)cancelClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
