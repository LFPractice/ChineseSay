//
//  CSHomeCommonChineseLevelListController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/13.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeCommonChineseLevelListController.h"
#import "CSHomeCommonChineseLevelCell.h"
@interface CSHomeCommonChineseLevelListController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation CSHomeCommonChineseLevelListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
#pragma mark - delegate
#pragma mark - UITableViewDataSource;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSHomeCommonChineseLevelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSHomeCommonChineseLevelCell"];
    [cell loadCellWithData:nil cellPath:indexPath];
    return cell;
}

#pragma mark - private
- (void)createUI{
    [self.navigationController.navigationBar setColor:[UIColor whiteColor]];
    [self.view addSubview:self.tableView];
}

#pragma mark - lazy load
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CSHomeCommonChineseLevelCell class] forCellReuseIdentifier:@"CSHomeCommonChineseLevelCell"];
//        _tableView.separatorColor =[UIColor clearColor];
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _tableView;
}
@end
