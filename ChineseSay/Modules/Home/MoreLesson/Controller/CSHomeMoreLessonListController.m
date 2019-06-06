//
//  CSHomeMoreLessonListController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/5.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeMoreLessonListController.h"
#import "CSHomeMoreLessonListCell.h"
#import "CSHomeItemSingleCellModel.h"
@interface CSHomeMoreLessonListController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation CSHomeMoreLessonListController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
#pragma mark - private
- (void)createUI{
    [self.view addSubview:self.tableView];
}
#pragma mark - delegate
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSHomeMoreLessonListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSHomeMoreLessonListCell"];
    [cell loadCellWithData:self.dataSource[indexPath.row] cellPath:indexPath];
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CSHomeItemSingleCellModel *model = self.dataSource[indexPath.row];
    [[CSPageTransfer shareInstance]dispatchTransFerActionWithPageModel:model.pageModel];
}

#pragma mark - lazy load
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kSystemStatusHeight - kSystemNavigationBarHeight) style:UITableViewStylePlain];
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.backgroundColor = [UIColor colorWithHex:0xF4F5F9];
        _tableView.separatorColor = [UIColor clearColor];
        [_tableView registerClass:[CSHomeMoreLessonListCell class] forCellReuseIdentifier:@"CSHomeMoreLessonListCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        CSHomeItemSingleCellModel *model1 = [[CSHomeItemSingleCellModel alloc]init];
        model1.title = @"30天商业中文速成";
        model1.imgName = @"home_cell_mark_lesson";
        model1.bgColor = 0xFAB416;
        model1.cellHeight = 120;
        CSPageTypeModel *pageModel1 = [[CSPageTypeModel alloc]init];
        pageModel1.title = @"30天商业中文速成";
        pageModel1.action = CS_Page_Type_Action;
        pageModel1.pageType = CS_Page_Type_Home_moreClassListDetail;
        model1.pageModel = pageModel1;
        
        CSHomeItemSingleCellModel *model2 = [[CSHomeItemSingleCellModel alloc]init];
        model2.title = @"茶文化";
        model2.imgName = @"home_cell_mark_teaCulture";
        model2.bgColor = 0x559F3A;
        CSPageTypeModel *pageModel2 = [[CSPageTypeModel alloc]init];
        pageModel2.title = @"茶文化";
        pageModel2.action = CS_Page_Type_Action;
        pageModel2.pageType = CS_Page_Type_Home_moreClassListDetail;
        model2.pageModel = pageModel2;
        
        CSHomeItemSingleCellModel *model3 = [[CSHomeItemSingleCellModel alloc]init];
        model3.title = @"诗词";
        model3.imgName = @"home_cell_mark_poetry";
        model3.bgColor = 0x6C80A8;
        CSPageTypeModel *pageModel3 = [[CSPageTypeModel alloc]init];
        pageModel3.title = @"诗词";
        pageModel3.action = CS_Page_Type_Action;
        pageModel3.pageType = CS_Page_Type_Home_moreClassListDetail;
        model3.pageModel = pageModel3;
        
        CSHomeItemSingleCellModel *model4 = [[CSHomeItemSingleCellModel alloc]init];
        model4.title = @"成语";
        model4.imgName = @"home_cell_mark_proverb";
        model4.bgColor = 0x3BB2BC;
        CSPageTypeModel *pageModel4 = [[CSPageTypeModel alloc]init];
        pageModel4.title = @"成语";
        pageModel4.action = CS_Page_Type_Action;
        pageModel4.pageType = CS_Page_Type_Home_moreClassListDetail;
        model4.pageModel = pageModel4;
        
        NSArray * itemsArr = @[model1,model2,model3,model4];

        _dataSource = itemsArr.mutableCopy;
    }
    return _dataSource;
}
@end
