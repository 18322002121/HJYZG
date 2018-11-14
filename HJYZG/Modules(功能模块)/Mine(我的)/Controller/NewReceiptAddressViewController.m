//
//  NewReceiptAddressViewController.m
//  HJYZG
//
//  Created by HCY on 2018/8/31.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "NewReceiptAddressViewController.h"
#import "NewReceiptAddressCell.h"

@interface NewReceiptAddressViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation NewReceiptAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"新增地址";
    self.view.backgroundColor=kRandomColor;
    [self createTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTable{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    _tableView.backgroundColor=KWhiteColor;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"NewReceiptAddressCell";//定义一个cell的标识
    NewReceiptAddressCell *cell=[tableView dequeueReusableCellWithIdentifier:str];//从缓存池中取出cell
    
    if (cell==nil) //如果缓存池中没有cell
        
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:str owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    _tableView.rowHeight = cell.frame.size.height;
    [self reloadNewReceiptAddressCell:cell];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    subView.backgroundColor=kRandomColor;
    return subView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    subView.backgroundColor=[UIColor colorWithRed:0.89 green:0.89 blue:0.91 alpha:1.00];
    return subView;
}


- (void)reloadNewReceiptAddressCell:(NewReceiptAddressCell *)cell{
    __weak typeof(cell) weakCell = cell;
    //选中默认地址按钮
    cell.selectAddressButton = ^(UIButton *sender) {
        sender.selected=!sender.selected;
        if (sender.selected) {
            [sender setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
        }else{
            [sender setImage:[UIImage imageNamed:@"未选中框"] forState:UIControlStateNormal];
        }
    };
    
    //保存并使用按钮
    cell.saveAndUseButton = ^(UIButton *sender) {
        [self.navigationController popViewControllerAnimated:YES];
    };
    
    //选择省市区按钮
    cell.provincialUrbanAreaButton = ^(UIButton *sender) {
        NSArray *defaultSelArr = @[@"浙江省", @"杭州市", @"西湖区"];
        NSArray *dataSource = nil; // dataSource 为空时，就默认使用框架内部提供的数据源（即 BRCity.plist）
        [BRAddressPickerView showAddressPickerWithShowType:BRAddressPickerModeArea dataSource:dataSource defaultSelected:defaultSelArr isAutoSelect:NO themeColor:nil resultBlock:^(BRProvinceModel *province, BRCityModel *city, BRAreaModel *area) {
//            textField.text = self.infoModel.addressStr = [NSString stringWithFormat:@"%@ %@ %@", province.name, city.name, area.name];
            NSLog(@"省[%@]：%@，%@", @(province.index), province.code, province.name);
            NSLog(@"市[%@]：%@，%@", @(city.index), city.code, city.name);
            NSLog(@"区[%@]：%@，%@", @(area.index), area.code, area.name);
            NSLog(@"--------------------");
            weakCell.provincialUrbanAreaLabel.text=[NSString stringWithFormat:@"%@ %@ %@",province.name,city.name,area.name];
        } cancelBlock:^{
            NSLog(@"点击了背景视图或取消按钮");
        }];
    };
}


@end
