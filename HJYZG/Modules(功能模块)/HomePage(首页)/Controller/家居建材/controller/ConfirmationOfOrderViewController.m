//
//  ConfirmationOfOrderViewController.m
//  HJYZG
//
//  Created by HCY on 2018/10/8.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ConfirmationOfOrderViewController.h"
#import "ConfirmationOfOrderCell.h"

@interface ConfirmationOfOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

static NSString *const confirmationOfOrderCell = @"ConfirmationOfOrderCell";

@implementation ConfirmationOfOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认订单";
    self.tableView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ConfirmationOfOrderCell class] forCellReuseIdentifier:confirmationOfOrderCell];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ConfirmationOfOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:confirmationOfOrderCell];
    return cell;
}




@end
