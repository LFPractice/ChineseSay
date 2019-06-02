//
//  CSHomeDataSource.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeDataSource.h"
#import "CSHomeCellModel.h"
#import "CSHomeTitleCellModel.h"
#import "CSHomeItemsCellModel.h"
#import "CSHomeItemSingleCellModel.h"
static CSHomeDataSource *homeSigle = nil;
@interface CSHomeDataSource()
@property (nonatomic, strong) NSMutableArray *arr_chineseSpeedUp;//中文速成
@property (nonatomic, strong) NSMutableArray *arr_cultureTravelApp;//文化、旅行、APP
@property (nonatomic, strong) NSMutableArray *arr_essay;//必读文章
@property (nonatomic, strong) NSMutableArray *arr_lesson;//更多课程
@end
@implementation CSHomeDataSource
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        homeSigle = [[super allocWithZone:NULL]init];
        [homeSigle initData];
    });
    return homeSigle;
}
- (void)initData{
    [self initDataForChineseSpeedUp];
    [self initDataForCultureTravelApp];
    [self initDataForEssay];
    [self initDataForLesson];
}
- (void)initDataForChineseSpeedUp{
    if(self.arr_chineseSpeedUp.count){
        [self.arr_chineseSpeedUp removeAllObjects];
    }
    CSHomeItemSingleCellModel *model = [[CSHomeItemSingleCellModel alloc]init];
    model.cellName = @"CSItemSigleCell";
    model.title = @"常用中文速成";
    model.cellHeight = 120;
    [self.arr_chineseSpeedUp addObject:model];
}
- (void)initDataForCultureTravelApp{
    if(self.arr_cultureTravelApp.count){
        [self.arr_cultureTravelApp removeAllObjects];
    }
    CSHomeItemsCellModel *model = [[CSHomeItemsCellModel alloc]init];
    model.cellName = @"CSHomeItemsCell";
    model.cellHeight = 160;
    [self.arr_cultureTravelApp addObject:model];
}
- (void)initDataForEssay{
    if(self.arr_essay.count){
        [self.arr_essay removeAllObjects];
    }
    
    CSHomeTitleCellModel *titleModel = [[CSHomeTitleCellModel alloc]init];
    titleModel.leftTitle = @"必读文章";
    titleModel.cellName = @"CSHomeTitleCell";
    titleModel.cellHeight = 35;
    [self.arr_essay addObject:titleModel];
    
    CSHomeItemSingleCellModel *model = [[CSHomeItemSingleCellModel alloc]init];
    model.cellName = @"CSItemSigleCell";
    model.title = @"How to use the Alipay ?";
    model.cellHeight = 120;
    [self.arr_essay addObject:model];
}
- (void)initDataForLesson{
    if(self.arr_lesson.count){
        [self.arr_lesson removeAllObjects];
    }
    CSHomeTitleCellModel *titleModel = [[CSHomeTitleCellModel alloc]init];
    titleModel.leftTitle = @"更多课程";
    titleModel.cellName = @"CSHomeTitleCell";
    titleModel.rightTitle = @"查看全部";
    titleModel.cellHeight = 35;
    [self.arr_lesson addObject:titleModel];
    
    CSHomeItemsCellModel *itemsModel = [[CSHomeItemsCellModel alloc]init];
    itemsModel.cellName = @"CSHomeItemsCell";
    itemsModel.cellHeight = 160;
    [self.arr_lesson addObject:itemsModel];
}
#pragma mark -- lazy
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        NSArray *sectionsArr = @[self.arr_chineseSpeedUp,
                                 self.arr_cultureTravelApp,
                                 self.arr_essay,
                                 self.arr_lesson];
        _dataSource = sectionsArr.mutableCopy;
    }
    return _dataSource;
}
- (NSMutableArray *)arr_chineseSpeedUp{
    if(!_arr_chineseSpeedUp){
        _arr_chineseSpeedUp = [[NSMutableArray alloc]init];
    }
    return _arr_chineseSpeedUp;
}
- (NSMutableArray *)arr_cultureTravelApp{
    if(!_arr_cultureTravelApp){
        _arr_cultureTravelApp = [[NSMutableArray alloc]init];
    }
    return _arr_cultureTravelApp;
}
- (NSMutableArray *)arr_essay{
    if(!_arr_essay){
        _arr_essay = [[NSMutableArray alloc]init];
    }
    return _arr_essay;
}
- (NSMutableArray *)arr_lesson{
    if(!_arr_lesson){
        _arr_lesson = [[NSMutableArray alloc]init];
    }
    return _arr_lesson;
}
@end
