//
//  CSGameQuestionCollectionViewCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/27.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSGameQuestionCollectionViewCell.h"
#import "CSGameQuestionTitleCell.h"
#import "CSGameQuestionItemCell.h"
#import "CSQuestionFooterView.h"
@interface CSGameQuestionCollectionViewCell()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)CSGameQuetionModel *questionModel;
@property (nonatomic, strong) CSQuestionFooterView *footerView;
@end
@implementation CSGameQuestionCollectionViewCell
#pragma mark - assist method
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createUI];
    }
    return self;
}
- (void)loadData:(CSGameQuetionModel *)model indexPath:(NSIndexPath *)indexPath{
    self.questionModel = model;
    NSArray * arr = self.questionModel.answers;
    self.questionModel.answers = [[NSMutableArray alloc]init];
    [self.questionModel.answers addObjectsFromArray:[CSGameQuestionItemModel mj_objectArrayWithKeyValuesArray:arr]];
    // = [CSGameQuestionItemModel mj_objectArrayWithKeyValuesArray:self.questionModel.answers];
}
- (void)createUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.tableView];
}
#pragma mark - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }
    return self.questionModel.answers.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSBaseCell *cell;
    if(indexPath.section == 0){
        CSGameQuestionTitleCell *titleCell = [tableView dequeueReusableCellWithIdentifier:@"CSGameQuestionTitleCell"];
        [titleCell loadCellWithData:self.questionModel cellPath:indexPath];
        cell = titleCell;
        
    }if(indexPath.section == 1){
        CSGameQuestionItemCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"CSGameQuestionItemCell"];
        itemCell.questionModel = self.questionModel;
        [itemCell loadData:self.questionModel.answers[indexPath.row] IndexPath:indexPath];
        cell = itemCell;
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1){
        tableView.tableFooterView = self.footerView;
        for (__strong CSGameQuestionItemModel *model in self.questionModel.answers) {
            model.isSelect = NO;
            model = [[CSGameQuestionItemModel alloc]init];
        }
        CSGameQuestionItemModel *itemModel = self.questionModel.answers[indexPath.row];
        itemModel.isSelect = YES;
        
        self.questionModel.isShowAnwser = YES;
    }
}
#pragma mark - lazy load
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        [_tableView registerClass:[CSGameQuestionItemCell class] forCellReuseIdentifier:@"CSGameQuestionItemCell"];
        [_tableView registerClass:[CSGameQuestionTitleCell class] forCellReuseIdentifier:@"CSGameQuestionTitleCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _tableView;
}
- (CSQuestionFooterView *)footerView{
    if(!_footerView){
        _footerView = [[CSQuestionFooterView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
        __weak typeof(self)weakSelf = self;
        _footerView.questionActionBlock = ^(CSQuestionAction action) {
            switch (action) {
                case CSQuestionActionSubmit:
                {
                    [weakSelf.tableView reloadData];
                    break;
                }
                case CSQuestionActionNext:
                {
                    if(weakSelf.nextQuestionBlock){
                        weakSelf.nextQuestionBlock();
                    }
                    break;
                }

                    
                default:
                    break;
            }
        };
    }
    return _footerView;
}
@end
