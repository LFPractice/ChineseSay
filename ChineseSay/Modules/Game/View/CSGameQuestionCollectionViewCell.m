//
//  CSGameQuestionCollectionViewCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/27.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSGameQuestionCollectionViewCell.h"
#import "CSGameQuestionItemCell.h"
@interface CSGameQuestionCollectionViewCell()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)CSGameQuetionModel *questionModel;
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
    self.questionModel.answers = [CSGameQuestionItemModel mj_objectArrayWithKeyValuesArray:self.questionModel.answers];
}
- (void)createUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.tableView];
}
#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.questionModel.answers.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSGameQuestionItemCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"CSGameQuestionItemCell"];
    [itemCell loadData:self.questionModel.answers[indexPath.row] IndexPath:indexPath];
    return itemCell;
}
#pragma mark - lazy load
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        [_tableView registerClass:[CSGameQuestionItemCell class] forCellReuseIdentifier:@"CSGameQuestionItemCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _tableView;
}
@end
