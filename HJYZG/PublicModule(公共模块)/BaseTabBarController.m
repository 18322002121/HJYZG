//
//  BaseTabBarController.m
//  HJYZG
//
//  Created by HCY on 2018/8/7.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "HomePageViewController.h"
#import "HomeFurnishingViewController.h"
#import "ShoppingCartViewController.h"
#import "MineViewController.h"
#import "RenovationViewController.h"
#import "ContactUsViewController.h"
#import "NearbyMerchantsViewController.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildVc];
    [self addTabarItems];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-添加导航控制器
- (void)addChildVc{
    BaseNavigationController *one=[[BaseNavigationController alloc]initWithRootViewController:[[HomePageViewController alloc]init]];
    
    BaseNavigationController *two=[[BaseNavigationController alloc]initWithRootViewController:[[NearbyMerchantsViewController alloc]init]];
    
    BaseNavigationController *three=[[BaseNavigationController alloc]initWithRootViewController:[[ShoppingCartViewController alloc]init]];
    
    BaseNavigationController *four=[[BaseNavigationController alloc]initWithRootViewController:[[ContactUsViewController alloc]init]];
    
    BaseNavigationController *five=[[BaseNavigationController alloc]initWithRootViewController:[[MineViewController alloc]init]];
    
    self.viewControllers=@[one,two,three,four,five];
}

- (void)addTabarItems
{
    
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"首页",
                                                 @"TabBarItemImage" : @"ic_home",
                                                 @"TabBarItemSelectedImage" : @"ic_home_down",
                                                 };
    
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  @"TabBarItemTitle" : @"附近商家",
                                                  @"TabBarItemImage" : @"jiaju",
                                                  @"TabBarItemSelectedImage" : @"jiaju_down",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"购物车",
                                                 @"TabBarItemImage" : @"gouwuche",
                                                 @"TabBarItemSelectedImage" : @"gouwuche_down",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  @"TabBarItemTitle" : @"联系我们",
                                                  @"TabBarItemImage" : @"zhuangxiu",
                                                  @"TabBarItemSelectedImage" : @"zhuangxiu_down"
                                                  };
    NSDictionary *fifthTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"我",
                                                 @"TabBarItemImage" : @"center",
                                                 @"TabBarItemSelectedImage" : @"center_down"
                                                 };
    NSArray<NSDictionary *>  *tabBarItemsAttributes = @[    firstTabBarItemsAttributes,
                                                            secondTabBarItemsAttributes,
                                                            thirdTabBarItemsAttributes,
                                                            fourthTabBarItemsAttributes,
                                                            fifthTabBarItemsAttributes
                                                            ];
    
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.tabBarItem.title = tabBarItemsAttributes[idx][@"TabBarItemTitle"];
        obj.tabBarItem.image = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemImage"]];
        obj.tabBarItem.selectedImage = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemSelectedImage"]];
        obj.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    }];
    
    self.tabBar.tintColor = [UIColor redColor];
}


@end
