//
//  CSHomeMoreLessonListDetailController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/6.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeMoreLessonListDetailController.h"
#import "CSHomeMoreLessonDetailFlowLayout.h"
#import "CSHomeMoreLessonDetailCollectionViewCell.h"
@interface CSHomeMoreLessonListDetailController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation CSHomeMoreLessonListDetailController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setWhiteBackItem];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[CSPlayer sharedInstance]stop];
}
#pragma private
- (void)createUI{
    self.view.backgroundColor = [UIColor colorWithHex:0xF4F5F9];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_controllerBg"]];
    [self.navigationController.navigationBar setColor:[UIColor clearColor]];
    [self.view addSubview:self.img_bg];
    [self.view addSubview:self.collectionView];
    
    [self loadData];
}
- (void)setPageModel:(CSPageTypeModel *)pageModel{
    [super setPageModel:pageModel];
    [self setTitle:self.pageModel.title Color:[UIColor whiteColor]];
}
- (void)loadData{
    [LFHttpTool home_getDataForCultureDetailListParams:self.pageModel.exparam Success:^(id responseObject) {
        self.dataSource = [[NSMutableArray alloc]initWithArray:[CSHomeMoreLessonListDetailItemModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]]];
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark - delegate
#pragma mark ------ UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CSHomeMoreLessonDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CSHomeMoreLessonDetailCollectionViewCell" forIndexPath:indexPath];
    [cell loadData:self.dataSource[indexPath.row] indexPath:indexPath];
    return cell;
}
#pragma mark ------ UICollectionViewDelegate
#pragma mark - lazy load
- (UICollectionView *)collectionView{
    if(!_collectionView){
        CSHomeMoreLessonDetailFlowLayout *layout = [[CSHomeMoreLessonDetailFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kSystemStatusHeight + kSystemNavigationBarHeight, kScreenWidth, kScreenHeight - kSystemStatusHeight - kSystemNavigationBarHeight) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CSHomeMoreLessonDetailCollectionViewCell class] forCellWithReuseIdentifier:@"CSHomeMoreLessonDetailCollectionViewCell"];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}
@end
