//
//  AutomobileTradeViewController.m
//  HJYZG
//
//  Created by HCY on 2018/9/18.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "AutomobileTradeViewController.h"

@interface AutomobileTradeViewController ()

@end

@implementation AutomobileTradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    [self custemNavigationSegment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//导航栏分页自定义

- (void)custemNavigationSegment{
    NSArray * items =  @[@"新车",@"二手车"];
    UISegmentedControl *segment = [[UISegmentedControl alloc ] initWithItems:items];
    segment.frame = CGRectMake(0,0, KScreenWidth*0.5, 30);
    // 设置在点击后是否恢复原样
    segment.momentary = YES;
    segment.tintColor = [UIColor redColor];//选中颜色
    segment.backgroundColor = [UIColor whiteColor];
    segment.momentary = NO;
    segment.selectedSegmentIndex = 0;//选中第几个segment 一般用于初始化时选中
    
    UIFont *font = [UIFont boldSystemFontOfSize:18.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    [segment setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    UIColor *greenColor = [UIColor grayColor];
    NSDictionary *colorAttr = [NSDictionary dictionaryWithObject:greenColor forKey:NSForegroundColorAttributeName];
    [segment setTitleTextAttributes:colorAttr forState:UIControlStateNormal];
    segment.layer.cornerRadius = 15;
    [segment addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView=segment;
}

- (void)segmentChanged:(UISegmentedControl *)sender{
    if (sender.selectedSegmentIndex==0) {
        NSLog(@"点击的是新车");
        self.view.backgroundColor = kRandomColor;
    }else{
        NSLog(@"点击的是二手车");
        self.view.backgroundColor = kRandomColor;
    }
}

@end
