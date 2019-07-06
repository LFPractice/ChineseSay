//
//  CSMineGetRecordController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/5.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineGetRecordController.h"
#import "CSMineGetRecordCell.h"
#import "CSMineGetJiFenHeader.h"
@interface CSMineGetRecordController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CSMineGetJiFenHeader *headerView;
@end

@implementation CSMineGetRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.img_bg];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CSMineGetRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSMineGetRecordCell"];
    return cell;
}

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, (self.navigationController.navigationBar.translucent?-(kSystemNavigationBarHeight + kSystemStatusHeight ):0), kScreenWidth,kScreenHeight + (self.navigationController.navigationBar.translucent? (kSystemNavigationBarHeight + kSystemStatusHeight ):0)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [_tableView registerNib:[UINib nibWithNibName:@"CSMineGetRecordCell" bundle:nil] forCellReuseIdentifier:@"CSMineGetRecordCell"];
        _tableView.tableHeaderView = self.headerView;
        _tableView.backgroundColor = [UIColor colorWithHex:0xF4F5F9];
        _tableView.separatorColor = [UIColor clearColor];
    }
    return _tableView;
}
- (CSMineGetJiFenHeader *)headerView {
    if(!_headerView) {
        _headerView = [[CSMineGetJiFenHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 184)];
        _headerView.backgroundColor = [UIColor blueColor];
        _headerView.isShowAction = NO;
    }
    return _headerView;
}


@end
