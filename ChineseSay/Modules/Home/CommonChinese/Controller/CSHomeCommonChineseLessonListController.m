//
//  CSHomeCommonChineseLessonListController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/13.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeCommonChineseLessonListController.h"
#import "CSHomeCommonChineseLessonCell.h"
#import "CSHomeLessonListHeader.h"
@interface CSHomeCommonChineseLessonListController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)CSHomeLessonListHeader *headerView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation CSHomeCommonChineseLessonListController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setColor:[UIColor clearColor]];
    [self setWhiteBackItem];
}
#pragma mark - private
- (void)createUI{
    [self.view addSubview:self.tableView];
    self.headerView.level = self.level;
    [self loadData];
}
- (void)loadData{
    [LFHttpTool home_getDataForLessonListParam:@{@"levelId":self.level}
                                       Success:^(id responseObject) {
                                           [self dealWithData:responseObject[@"data"][@"list"]];
    }
                                       Failure:^(NSError *error) {
        
    }];
}
- (void)dealWithData:(NSArray *)array{
    [self.dataSource addObjectsFromArray:[CSHomeLessonModel mj_objectArrayWithKeyValuesArray:array]];
    
    [self.tableView reloadData];
}
#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSHomeCommonChineseLessonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSHomeCommonChineseLessonCell"];
    [cell loadCellWithData:self.dataSource[indexPath.row] cellPath:indexPath];
    return cell;
}
#pragma mark - lazy load
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -(kSystemNavigationBarHeight + kSystemStatusHeight), kScreenWidth, kScreenHeight + (kSystemNavigationBarHeight + kSystemStatusHeight)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CSHomeCommonChineseLessonCell class] forCellReuseIdentifier:@"CSHomeCommonChineseLessonCell"];
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.tableHeaderView = self.headerView;
        _tableView.separatorColor = [UIColor clearColor];
    }
    return _tableView;
}
- (CSHomeLessonListHeader *)headerView{
    if(!_headerView){
        _headerView = [[CSHomeLessonListHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 246)];
    }
    return _headerView;
}
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}
@end
