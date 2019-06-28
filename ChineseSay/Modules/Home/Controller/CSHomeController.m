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
#import "CSHomeCenterBannerCell.h"
#import "CSHomeCellModel.h"
#import "CSHomeHeaderView.h"
@interface CSHomeController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) CSBaseTableView *tableView;
@property (nonatomic, strong) CSHomeHeaderView *headerView;
@end

@implementation CSHomeController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
#pragma mark - delegate
#pragma mark ------ UITableViewDataSource
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
    return 0;
}
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
    sectionHeader.backgroundColor = [UIColor colorWithHex:0xF4F5F9];
    return sectionHeader;
}

#pragma mark - private
- (void)createUI{
    [self.view addSubview:self.tableView];
    [[CSHomeDataSource shareInstance] loadDataForHome];
    __weak typeof(self)weakSelf = self;
    [[CSHomeDataSource shareInstance] setRefreshData:^{
        [weakSelf.tableView reloadData];
        [weakSelf.headerView reloadData];
    }];
}

#pragma mark -- lazy load
- (CSBaseTableView *)tableView{
    if(!_tableView){
        _tableView = [[CSBaseTableView alloc]initWithFrame:CGRectMake(0, -kSystemStatusHeight,kScreenWidth, kScreenHeight - 49 - kSystemBottomHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource  = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor colorWithHex:0xF4F5F9];
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerClass:[CSHomeTitleCell class] forCellReuseIdentifier:@"CSHomeTitleCell"];
        [_tableView registerClass:[CSHomeItemsCell class] forCellReuseIdentifier:@"CSHomeItemsCell"];
        [_tableView registerClass:[CSItemSigleCell class] forCellReuseIdentifier:@"CSItemSigleCell"];
        [_tableView registerClass:[CSHomeCenterBannerCell class] forCellReuseIdentifier:@"CSHomeCenterBannerCell"];
    }
    return _tableView;
}
- (CSHomeHeaderView *)headerView{
    if(!_headerView){
        _headerView = [[CSHomeHeaderView alloc]init];
        _headerView.frame = CGRectMake(0, 0, kScreenWidth, 214);
    }
    return _headerView;
}

//去掉UItableview headerview黏性(sticky)
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView)
    {
        CGFloat sectionHeaderHeight = 20;  //sectionHeaderHeight
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}
@end
