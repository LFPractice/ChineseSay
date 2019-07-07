//
//  CSHomeAppListController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/9.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeAppListController.h"
#import "CSHomeAppListCell.h"
#import "CSHomeEssayDetailController.h"
@interface CSHomeAppListController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation CSHomeAppListController
{
    UIView *view_bg;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    UIView *view = [[UIView alloc]init];
    view.layer.cornerRadius = 10;
    view.backgroundColor = [UIColor blueColor];
    view_bg = view;
//    [self.view addSubview:view];
    [self createUI];
    
    UIRectCorner corner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
    
//    self.tableView.layer.cornerRadius = 10;
    
    [self.tableView cs_radiusWithRadius:10 corner:corner];
    self.tableView.layer.masksToBounds = 10;
}
- (void)viewWillAppear:(BOOL)animated {
    [self setWhiteBackItem];
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-(kSystemNavigationBarHeight + kSystemStatusHeight + 50));
    }];
}

#pragma mark - delegate
#pragma mark ------ UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSHomeAppListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSHomeAppListCell"];
    [cell loadCellWithData:self.dataSource[indexPath.row] cellPath:indexPath];
    return cell;
}
#pragma mark ------ UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CSHomeAppModel *mode = self.dataSource[indexPath.row];
    CSHomeEssayDetailController *VC = [[CSHomeEssayDetailController alloc]init];
    VC.id = mode.id;
    [self.navigationController pushViewController:VC animated:YES];
}
#pragma mark - private
- (void)createUI{
    [self.view addSubview:self.tableView];
    [self loadData];
}
- (void)loadData{
    NSDictionary *param = @{@"category":self.catorgary};
    [LFHttpTool home_getDataForAppListParam:param Success:^(id responseObject) {
        NSNumber *code = responseObject[@"code"];
        if(code.intValue == 200){
            [self dealWithData:responseObject[@"data"][@"list"]];
        }
        [self.tableView reloadData];
    } Failure:^(NSError *error) {
        
    }];
}
- (void)dealWithData:(NSArray *)array{
    [self.dataSource addObjectsFromArray:[CSHomeAppModel mj_objectArrayWithKeyValuesArray:array]];
}
#pragma mark - lazy load
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CSHomeAppListCell class] forCellReuseIdentifier:@"CSHomeAppListCell"];
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor colorWithHex:0xffffff alpha:0.6];
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
