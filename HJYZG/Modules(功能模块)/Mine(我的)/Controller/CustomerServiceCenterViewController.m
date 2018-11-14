//
//  CustomerServiceCenterViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "CustomerServiceCenterViewController.h"

@interface CustomerServiceCenterViewController ()

@end

@implementation CustomerServiceCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"客服中心";
    self.view.backgroundColor=[UIColor clearColor];
    [self reloadShowView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadShowView{
    
    UIView *showView=[[UIView alloc]init];
    showView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:showView];
    
    PublicLabel *contactLabel = [PublicLabel labelWithFrame:CGRectMake(0, 0, 0, 0) text:@"联系客服" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:13.0] textAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor]];
    [showView addSubview:contactLabel];

    PublicButton *cancelButton = [PublicButton buttonWithFrame:CGRectMake(0, 0, 0, 0) image:@"取消" backgroundImageImage:@"" title:@"" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:showView target:self action:@selector(cancelClick:)];
    
    //背景view
    UIView *backView1=[[UIView alloc]init];
    backView1.backgroundColor=[UIColor redColor];
    [showView addSubview:backView1];
    
    UIView *backView2=[[UIView alloc]init];
    backView2.backgroundColor=[UIColor redColor];
    [showView addSubview:backView2];
    
    //联系QQ
    PublicButton *qqButton = [PublicButton  buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleTop) image:@"医药箱" backgroundImageImage:@"" title:@"联系QQ" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor greenColor] addView:showView target:self action:@selector(qqClick:)];
    
    //呼叫电话
    PublicButton *callButton = [PublicButton  buttonWithFrame:CGRectMake(0, 0, 0, 0) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleTop) image:@"医药箱" backgroundImageImage:@"" title:@"呼叫电话" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor greenColor] addView:showView target:self action:@selector(callClick:)];
    
    [showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(0);
        make.centerY.mas_equalTo(self.view.mas_centerY).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(40);
        make.right.mas_equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(showView.mas_width).offset(-100);
    }];
    
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(showView.mas_right).offset(0);
        make.top.mas_equalTo(showView.mas_top).mas_offset(0);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [backView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(showView.mas_top).offset(30);
        make.left.mas_equalTo(showView.mas_left).offset(0);
        make.bottom.mas_equalTo(showView.mas_bottom).offset(0);
        make.right.mas_equalTo(showView.mas_centerX).offset(0);
    }];
    
    [backView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(showView.mas_top).offset(30);
        make.left.mas_equalTo(showView.mas_centerX).offset(0);
        make.bottom.mas_equalTo(showView.mas_bottom).offset(0);
        make.right.mas_equalTo(showView.mas_right).offset(0);
    }];
    
    [qqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(backView1.mas_centerX).offset(0);
        make.centerY.mas_equalTo(backView1.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];

    [callButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(backView2.mas_centerX).offset(0);
        make.centerY.mas_equalTo(backView2.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [contactLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(showView.mas_centerX).offset(0);
        make.top.mas_equalTo(showView.mas_top).offset(10);
    }];
    
}

- (void)cancelClick:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)qqClick:(UIButton *)sender{
    
}

- (void)callClick:(UIButton *)sender{
    NSMutableString *str=[[NSMutableString alloc]initWithFormat:@"tel:%@",@"18322002121"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}




@end
