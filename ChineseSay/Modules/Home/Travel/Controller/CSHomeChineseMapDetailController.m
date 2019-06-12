//
//  CSHomeChineseMapDetailController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/11.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeChineseMapDetailController.h"
#import "CSHomeChineseMapDetailFlowLayout.h"
#import "CSHomeChineseMapDetailCell.h"
@interface CSHomeChineseMapDetailController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation CSHomeChineseMapDetailController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
#pragma private
- (void)createUI{
    self.view.backgroundColor = [UIColor colorWithHex:0xF4F5F9];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_controllerBg"]];
    [self.navigationController.navigationBar setColor:[UIColor clearColor]];
    [self.view addSubview:self.collectionView];
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
    CSHomeChineseMapDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CSHomeChineseMapDetailCell" forIndexPath:indexPath];
    [cell loadDataWithModel:self.dataSource[indexPath.row] forIndex:indexPath];
    return cell;
}
#pragma mark ------ UICollectionViewDelegate
#pragma mark - lazy load
- (UICollectionView *)collectionView{
    if(!_collectionView){
        CSHomeChineseMapDetailFlowLayout *layout = [[CSHomeChineseMapDetailFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kSystemStatusHeight - kSystemNavigationBarHeight) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[CSHomeChineseMapDetailCell class] forCellWithReuseIdentifier:@"CSHomeChineseMapDetailCell"];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [[NSMutableArray alloc]init];
        NSArray *arr_imgName = @[@"home_map_dongBei",@"home_map_huaBei",@"home_map_huaDong",@"home_map_huaNan",
                                 @"home_map_huaZhong",@"home_map_taiWan",@"home_map_xiBei",@"home_map_xiNan"];
        NSArray *arr_name = @[@"东北地区",@"华北地区",@"华东地区",@"华南地区",@"华中地区",@"台湾地区",@"西北地区",@"西南地区",];
        for(int i = 0 ;i < arr_imgName.count; i++){
            CSHomeMapDetailModel *model = [[CSHomeMapDetailModel alloc]init];
            model.img_big = arr_imgName[i];
            model.name = arr_name[i];
            
            CSPageTypeModel *pageModel = [[CSPageTypeModel alloc]init];
            pageModel.action = CS_Page_Type_Action;
            pageModel.pageType = CS_Page_Type_Home_PlaceDetail;
            
            model.pageModel = pageModel;
            [_dataSource addObject:model];
        }
    }
    return _dataSource;
}
@end
