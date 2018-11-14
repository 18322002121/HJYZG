//
//  ShoppingCartViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/7.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "ShoppingCartModel.h"
#import "ShoppingCartCell.h"
#import "SettlementView.h"
#import "ShoppingCartHeaderView.h"

@interface ShoppingCartViewController ()
@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) UIButton *selectedBtn;
@property (weak, nonatomic) UIButton *deleteBtn;
@property (weak, nonatomic) UIImageView *editView;
@property (strong, nonatomic) NSMutableArray *dataArr;
@property (strong, nonatomic) NSMutableArray *deleteArr;
@property (assign, nonatomic) NSInteger deleteNum;
@property (nonatomic,strong) NSMutableArray *storeArray;
@property (nonatomic,strong) PublicButton *rightButton;
@end

@implementation ShoppingCartViewController


-(NSMutableArray *)storeArray{
    if (!_storeArray) {
        _storeArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _storeArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"购物车";
    self.deleteArr = [[NSMutableArray alloc]init];
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    UITableView *tableView;
    if (self.tabBarController.tabBar.isHidden == YES) {
        tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-50) style:UITableViewStyleGrouped];
    }else{
        tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-tabBarHeight-50) style:UITableViewStyleGrouped];
    }
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self bottomSettlement];
    [self.tableView registerNib:[UINib nibWithNibName:@"ShoppingCartHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"ShoppingCartHeaderView"];
//    [self loadingDataForPlist];
    [self reloadAdministration];
   
}

- (void)reloadAdministration{
    _rightButton=[PublicButton buttonWithFrame:CGRectMake(0, 0, 40, 33) buttonEdgeInsetsStyle:(UIButtonEdgeInsetsStyleRight) image:@"" backgroundImageImage:@"" title:@"管理" titleColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:13.0] backgroundColor:[UIColor clearColor] addView:nil target:self action:@selector(rightBarClick)];
    UIBarButtonItem  *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem=rightBarButtonItem;
}

- (void)rightBarClick{
    NSLog(@"管理界面");
}

#pragma mark - DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str=@"ShoppingCartCell";//定义一个cell的标识
    ShoppingCartCell *cell=[tableView dequeueReusableCellWithIdentifier:str];//从缓存池中取出cell

    if (cell==nil) //如果缓存池中没有cell
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    _tableView.rowHeight = cell.frame.size.height;
    [self reloadShoppingCartCell:cell];
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ShoppingCartHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ShoppingCartHeaderView"];
    _tableView.sectionHeaderHeight=headerView.frame.size.height;
    headerView.buttonClick = ^(UIButton *sender) {
        NSLog(@"商店名称点击");
    };
    headerView.shopImageButton = ^(UIButton *sender) {
        NSLog(@"section选中");
    };
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

//底部结算view
- (void)bottomSettlement{
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    SettlementView *settlementView;
    if (self.tabBarController.tabBar.isHidden == YES) {
        settlementView=[[SettlementView alloc]initWithFrame:CGRectMake(0, KScreenHeight-50, KScreenWidth, 50)];
    }else{
        settlementView=[[SettlementView alloc]initWithFrame:CGRectMake(0, KScreenHeight-tabBarHeight-50, KScreenWidth, 50)];
    }
    settlementView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:settlementView];
    //全选
    settlementView.selectButton = ^(UIButton *sender) {
        NSLog(@"全选按钮");
        sender.selected = !sender.selected;
        if (sender.selected) {
            [sender setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateSelected];
        }else{
            [sender setImage:[UIImage imageNamed:@"未选中"] forState:UIControlStateSelected];
        }
    };

    //结算
    settlementView.settlementButton = ^(UIButton *sender) {
        NSLog(@"结算");

    };
    
    
    
}

//
//#pragma mark  -------------------- 此处模仿网络请求, 加载plist文件内容
//- (void)loadingDataForPlist {
//    NSString *path=[[NSBundle mainBundle]pathForResource:@"ShopCarNew" ofType:@"plist"];
//    NSDictionary *dataDic=[[NSDictionary alloc]initWithContentsOfFile:path];
//    NSLog(@"%@",dataDic);
//    NSArray *dataArr=dataDic[@"data"];
//    if (dataArr.count>0) {
//        for (NSDictionary *dict in dataArr) {
//            ShoppingCartModel *model=[[ShoppingCartModel alloc]init];
//            [model setValuesForKeysWithDictionary:dict];
//            [self.storeArray addObject:model];
//        }
//        NSLog(@"%@",self.storeArray);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//    }
//}

- (void)reloadShoppingCartCell:(ShoppingCartCell *)cell{
    //增加
    cell.IncreaseButton = ^(NSInteger sender) {
        NSLog(@"%ld",(long)sender);
    };
    
    //减少
    cell.ReduceButton = ^(NSInteger sender) {
        NSLog(@"%ld",(long)sender);
    };
    
}

@end
