//
//  ViewAllOrdersViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/15.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ViewAllOrdersViewController.h"
#import "TotaCell.h"
#import "PendingPaymentCell.h"
#import "PendingDeliveryCell.h"
#import "GoodsToReceivedCell.h"
#import "ToBeEvaluatedCell.h"
#import "ViewAllOrdersListViewController.h"

@interface ViewAllOrdersViewController ()<ZJScrollPageViewDelegate>
@property(nonatomic,strong)NSArray<NSString *> *titles;
@property(nonatomic,strong)ZJScrollPageView *scrollPageView;
@property(strong, nonatomic)NSArray<UIViewController *> *childVcs;
@end

@implementation ViewAllOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"全部订单";
    self.view.backgroundColor=kRandomColor;
    [self reloadScrollviewSegment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建头部滚动条
- (void)reloadScrollviewSegment{
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    style.showLine = YES;//显示滚动条
    style.gradualChangeTitleColor = YES;// 颜色渐变
    style.autoAdjustTitlesWidth=YES;
    style.adjustCoverOrLineWidth=YES;
    self.titles = @[@"全部",
                    @"待付款",
                    @"待发货",
                    @"待收货",
                    @"待评价",
                    ];
    _scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, self.view.bounds.size.width, self.view.bounds.size.height - 64.0) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    [self.view addSubview:_scrollPageView];

}




- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    
    if (!childVc) {
        childVc = [[ViewAllOrdersListViewController alloc] init];
    }
    
        NSLog(@"%ld-----%@",(long)index, childVc);
    
    return childVc;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}



//- (void)reloadAddButton:(PendingPaymentCell *)cell{
//    __weak typeof(cell)weakCell =cell;
//    //拨打电话
//    cell.callPhoneButton = ^(UIButton *sender) {
//        NSLog(@"拨打电话");
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%ld",[weakCell.phoneNumber.text integerValue]]]];
//    };
//    
//    //取消订单
//    cell.cancellationOfOrderButton = ^(UIButton *sender) {
//        NSLog(@"取消订单");
//    };
//    
//    //立即支付
//    cell.immediatePaymentButton = ^(UIButton *sender) {
//        NSLog(@"立即支付");
//    };
//}



@end
