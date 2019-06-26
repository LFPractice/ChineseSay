//
//  CSHomeCommonChineseLevelListController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/13.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeCommonChineseLevelListController.h"
#import "CSHomeCommonChineseLevelCell.h"
#import "CSHomeCommonChineseLevelCell2.h"
#import "CSHomeCommonChineseLessonListController.h"
@interface CSHomeCommonChineseLevelListController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation CSHomeCommonChineseLevelListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    [self loadData];
}
#pragma mark - delegate
#pragma mark - UITableViewDataSource;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSHomeCommonChineseLevelCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"CSHomeCommonChineseLevelCell2"];
    [cell loadCellWithData:self.dataSource[indexPath.row] cellPath:indexPath];
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CSHomeLevelModel *model = self.dataSource[indexPath.row];
    CSHomeCommonChineseLessonListController *lessonListVC = [[CSHomeCommonChineseLessonListController alloc]init];
    lessonListVC.level = model.level;
    [self.navigationController pushViewController:lessonListVC animated:YES];
}

#pragma mark - private
- (void)createUI{
    [self.navigationController.navigationBar setColor:[UIColor whiteColor] showBottomLine:YES];
    [self.view addSubview:self.tableView];
}
- (void)loadData{
    [LFHttpTool home_getDataForLevelListParam:@{} Success:^(id responseObject) {
        [self dealWithData:responseObject[@"data"][@"list"]];
    } Failure:^(NSError *error) {
        
    }];
}
- (void)dealWithData:(NSArray *)array{
    [self.dataSource addObjectsFromArray:[CSHomeLevelModel mj_objectArrayWithKeyValuesArray:array]];
    [self.tableView reloadData];
}
#pragma mark - lazy load
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kSystemNavigationBarHeight + kSystemStatusHeight, kScreenWidth, kScreenHeight - kSystemNavigationBarHeight - kSystemStatusHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CSHomeCommonChineseLevelCell2 class] forCellReuseIdentifier:@"CSHomeCommonChineseLevelCell2"];
        _tableView.separatorColor =[UIColor clearColor];
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _tableView;
}
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}
@end
