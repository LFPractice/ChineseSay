//
//  CSHomeTravelController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/11.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeTravelController.h"
#import "CSGameModel.h"
#import "CSGameCell.h"
@interface CSHomeTravelController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UILabel *label_title;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation CSHomeTravelController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}
- (void)viewWillAppear:(BOOL)animated{
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - delegate
#pragma mark ------ UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSGameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSGameCell"];
    [cell loadCellWithData:self.dataSource[indexPath.row] cellPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
#pragma mark ------ UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[CSPageTransfer shareInstance]dispatchTransFerActionWithPageModel:((CSBaseModel *)self.dataSource[indexPath.row]).pageModel];
}

#pragma mark - private
- (void)createUI{
    [self.view addSubview:self.label_title];
    [self.view addSubview:self.tableView];
}

#pragma mark - lazy load
- (UILabel *)label_title{
    if(!_label_title){
        _label_title = [[UILabel alloc]initWithFrame:CGRectMake(20, 89, kScreenWidth - 40, 42)];
        _label_title.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:30];
        _label_title.text = @"Travel in China";
        _label_title.textColor = [UIColor blackColor];
    }
    return _label_title;
}
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 215, kScreenWidth, kScreenHeight - CGRectGetMaxY(self.label_title.frame) - 49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor clearColor];
        [_tableView registerClass:[CSGameCell class] forCellReuseIdentifier:@"CSGameCell"];
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _tableView;
}
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        CSGameModel *model1 = [[CSGameModel alloc]init];
        model1.title = @"问路";
        model1.bgColor = 0xF57F7F;
        CSPageTypeModel *pageModel1 = [[CSPageTypeModel alloc]init];
        pageModel1.action = CS_Page_Type_Action;
        pageModel1.pageType = CS_Page_Type_Home_TravelSentences;
        pageModel1.title = @"常用句子";
        model1.pageModel = pageModel1;
        
        CSGameModel *model2 = [[CSGameModel alloc]init];
        model2.title = @"机场/火车站场景";
        model2.bgColor = 0x6F6FD6;
        CSPageTypeModel *pageModel2 = [[CSPageTypeModel alloc]init];
        pageModel2.action = CS_Page_Type_Action;
        pageModel2.pageType = CS_Page_Type_Home_TravelSentences;
        pageModel2.title = @"常用句子";
        model2.pageModel = pageModel2;
        
        
        _dataSource = @[model1,model2].mutableCopy;
    }
    return _dataSource;
}

@end
