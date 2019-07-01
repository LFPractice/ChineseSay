//
//  CSMineDetailController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/15.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineDetailController.h"
#import "CSMineActivityCell.h"
#import "CSMineItemCell.h"
#import "CSMineHeaderView.h"
#import "CSMineItemModel.h"
@interface CSMineDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CSMineHeaderView *view_header;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation CSMineDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

#pragma mark - delegate
#pragma mark ------ UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 80;
    }
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [(NSArray *)self.dataSource[section] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor colorWithHex:0xF4F5F9];
    return headerView;
    
}
#pragma mark ------ UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSMineItemModel * model = self.dataSource[indexPath.section][indexPath.row];
    CSBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellName];
    [cell loadCellWithData:model cellPath:indexPath];
    return cell;
}
#pragma mark - private
- (void)createUI{
    [self.view addSubview:self.tableView];
}

#pragma mark - lazy load
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 49 - kSystemBottomHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.tableHeaderView = self.view_header;
        [_tableView registerClass:[CSMineActivityCell class] forCellReuseIdentifier:@"CSMineActivityCell"];
        [_tableView registerClass:[CSMineItemCell classForKeyedArchiver] forCellReuseIdentifier:@"CSMineItemCell"];
        _tableView.backgroundColor = [UIColor colorWithHex:0xF4F5F9];
        _tableView.separatorColor = [UIColor clearColor];
    }
    return _tableView;
}
- (CSMineHeaderView *)view_header{
    if(!_view_header){
        _view_header = [[CSMineHeaderView alloc]init];
        _view_header.frame = CGRectMake(0, 0, kScreenWidth, 300);
    }
    return _view_header;
}
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [[NSMutableArray alloc]init];
        
        CSMineItemModel *model_section0 = [[CSMineItemModel alloc]init];
        model_section0.cellName = @"CSMineActivityCell";
        NSArray *arr0 = @[model_section0];
        
        NSArray *arr1 = @[@{@"title":@"新消息",
                            @"count":@"99",
                            @"cellName":@"CSMineItemCell"
                            },
                          @{@"title":@"联系我们",
                            @"count":@"",
                            @"cellName":@"CSMineItemCell"
                            },
                          @{@"title":@"语言设置",
                            @"count":@"",
                            @"cellName":@"CSMineItemCell"
                            },
                          @{@"title":@"消息提醒设置",
                            @"count":@"",
                            @"cellName":@"CSMineItemCell"
                            },];
        [_dataSource addObject:arr0];
        [_dataSource addObject:[CSMineItemModel mj_objectArrayWithKeyValuesArray:arr1]];
    }
    return _dataSource;
}
@end
