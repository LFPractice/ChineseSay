//
//  CSGameQuestionListController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/27.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSGameQuestionListController.h"
#import "CSGameQuestionCollectionViewCell.h"

@interface CSGameQuestionListController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation CSGameQuestionListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
#pragma mark - delegate
#pragma mark ------ UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;//self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CSGameQuestionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CSGameQuestionCollectionViewCell" forIndexPath:indexPath];
    [cell loadData:self.dataSource[indexPath.row] indexPath:indexPath];
    return cell;
}
#pragma mark ------ UICollectionViewDelegate

#pragma mark - private
- (void)createUI{
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.collectionView];
    [self loadData];
}
- (void)loadData{
    [LFHttpTool game_getDataForQuestionListParam:@{} Success:^(id responseObject) {
        [self dealWithData:responseObject[@"data"][@"list"]];
    } Failure:^(NSError *error) {
        
    }];
}
- (void)dealWithData:(NSArray *)array{
    [self.dataSource addObjectsFromArray:[CSGameQuetionModel mj_objectArrayWithKeyValuesArray:array]];
    [self.collectionView reloadData];
}
#pragma mark - lazy load
- (UICollectionView *)collectionView{
    if(!_collectionView){
        CSGameQuestionCollectionViewFlowLayout *layout = [[CSGameQuestionCollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kSystemStatusHeight + kSystemNavigationBarHeight, kScreenWidth, kScreenHeight - kSystemStatusHeight - kSystemNavigationBarHeight) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CSGameQuestionCollectionViewCell class] forCellWithReuseIdentifier:@"CSGameQuestionCollectionViewCell"];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}
@end
