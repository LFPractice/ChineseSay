//
//  CSHomeChinesePlaceDetailController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/11.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeChinesePlaceDetailController.h"
#import "CSHomeChinesePlaceDetailFlowLayout.h"
#import "CSHomeChinesePlaceDetailCell.h"
@interface CSHomeChinesePlaceDetailController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation CSHomeChinesePlaceDetailController

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
    [self.view addSubview:self.img_bg];
    [self.navigationController.navigationBar setColor:[UIColor clearColor]];
    [self.view addSubview:self.collectionView];
}
#pragma mark - delegate
#pragma mark ------ UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CSHomeChinesePlaceDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CSHomeChinesePlaceDetailCell" forIndexPath:indexPath];
    return cell;
}
#pragma mark ------ UICollectionViewDelegate
#pragma mark - lazy load
- (UICollectionView *)collectionView{
    if(!_collectionView){
        CSHomeChinesePlaceDetailFlowLayout *layout = [[CSHomeChinesePlaceDetailFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kSystemStatusHeight + kSystemNavigationBarHeight, kScreenWidth, kScreenHeight - kSystemStatusHeight - kSystemNavigationBarHeight) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CSHomeChinesePlaceDetailCell class] forCellWithReuseIdentifier:@"CSHomeChinesePlaceDetailCell"];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
