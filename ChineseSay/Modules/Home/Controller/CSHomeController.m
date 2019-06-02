//
//  CSHomeController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeController.h"
#import "CSHomeDataSource.h"
#import "CSHomeTitleCell.h"
#import "CSHomeItemsCell.h"
#import "CSItemSigleCell.h"
#import "CSHomeCellModel.h"
@interface CSHomeController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) CSBaseTableView *tableView;
@end

@implementation CSHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void)createUI{
    [self.view addSubview:self.tableView];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[CSHomeDataSource shareInstance]dataSource].count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *item = [[CSHomeDataSource shareInstance]dataSource][section];
    return item.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSHomeCellModel *model = [CSHomeDataSource shareInstance].dataSource[indexPath.section][indexPath.row];
    return model.cellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSMutableArray *item = [[CSHomeDataSource shareInstance]dataSource][section];
    if(item.count == 0){
        return 0;
    }
    return 10;
}
#pragma mark -- UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSHomeCellModel *model = [CSHomeDataSource shareInstance].dataSource[indexPath.section][indexPath.row];
    CSBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellName];
    [cell loadCellWithData:model cellPath:indexPath];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSMutableArray *item = [[CSHomeDataSource shareInstance]dataSource][section];
    if(item.count == 0){
        return nil;
    }
    UIView *sectionHeader = [[UIView alloc]init];
    sectionHeader.backgroundColor = [UIColor lightGrayColor];
    return nil;
}
#pragma mark -- lazy
- (CSBaseTableView *)tableView{
    if(!_tableView){
        _tableView = [[CSBaseTableView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight - kSystemNavigationBarHeight - kSystemStatusHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource  = self;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor lightGrayColor];
        [_tableView registerClass:[CSHomeTitleCell class] forCellReuseIdentifier:@"CSHomeTitleCell"];
        [_tableView registerClass:[CSHomeItemsCell class] forCellReuseIdentifier:@"CSHomeItemsCell"];
        [_tableView registerClass:[CSItemSigleCell class] forCellReuseIdentifier:@"CSItemSigleCell"];
    }
    return _tableView;
}
//去掉UItableview headerview黏性(sticky)
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView)
    {
        CGFloat sectionHeaderHeight = 10;  //sectionHeaderHeight
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}
@end
