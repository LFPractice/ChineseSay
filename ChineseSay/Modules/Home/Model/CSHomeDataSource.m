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

#pragma mark -- 常用中文速成
- (void)initDataForChineseSpeedUp{
    if(self.arr_chineseSpeedUp.count){
        [self.arr_chineseSpeedUp removeAllObjects];
    }
    CSHomeItemSingleCellModel *model = [[CSHomeItemSingleCellModel alloc]init];
    model.cellName = @"CSItemSigleCell";
    model.title = @"常用中文速成";
    model.imgName = @"home_cell_mark_chineseSpeedUp";
    model.bgColor = 0x6C80A8;
    model.cellHeight = 120;
    [self.arr_chineseSpeedUp addObject:model];
}

#pragma mark -- 文化、旅行、APP
- (void)initDataForCultureTravelApp{
    if(self.arr_cultureTravelApp.count){
        [self.arr_cultureTravelApp removeAllObjects];
    }
    CSHomeItemsCellModel *model = [[CSHomeItemsCellModel alloc]init];
    model.cellName = @"CSHomeItemsCell";
    model.cellHeight = 160;
    [self.arr_cultureTravelApp addObject:model];
    
    CSHomeItemSingleCellModel *model1 = [[CSHomeItemSingleCellModel alloc]init];
    model1.title = @"筷子文化";
    model1.imgName = @"home_cell_mark_chineseSpeedUp";
    model1.bgColor = 0xFAB416;
    
    CSHomeItemSingleCellModel *model2 = [[CSHomeItemSingleCellModel alloc]init];
    model2.title = @"中国旅行";
    model2.imgName = @"home_cell_mark_travel";
    model2.bgColor = 0xF57F7F;
    
    CSHomeItemSingleCellModel *model3 = [[CSHomeItemSingleCellModel alloc]init];
    model3.title = @"常用中文APP";
    model3.imgName = @"home_cell_mark_app";
    model3.bgColor = 0x6F6FD6;
    
    NSArray * itemsArr = @[model1,model2,model3];
    model.extparam = itemsArr;

}

#pragma mark -- 必读文章
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

#pragma mark -- 更多课程
- (void)initDataForLesson{
    if(self.arr_lesson.count){
        [self.arr_lesson removeAllObjects];
    }
    CSHomeTitleCellModel *titleModel = [[CSHomeTitleCellModel alloc]init];
    titleModel.leftTitle = @"更多课程";
    titleModel.cellName = @"CSHomeTitleCell";
    titleModel.rightTitle = @"查看全部";
    titleModel.cellHeight = 35;
    CSPageTypeModel *pageModel_moreLesson = [[CSPageTypeModel alloc]init];
    pageModel_moreLesson.action = CS_Page_Type_Action;
    pageModel_moreLesson.pageType = CS_Page_Type_Home_moreClassList;
    pageModel_moreLesson.title = @"更多课程";
    titleModel.pageModel = pageModel_moreLesson;
    [self.arr_lesson addObject:titleModel];
    
    CSHomeItemSingleCellModel *singleModel = [[CSHomeItemSingleCellModel alloc]init];
    singleModel.cellName = @"CSItemSigleCell";
    singleModel.title = @"30天商业中文速成";
    singleModel.imgName = @"home_cell_mark_lesson";
    singleModel.bgColor = 0xFAB416;
    singleModel.cellHeight = 120;
    CSPageTypeModel *pageModel1 = [[CSPageTypeModel alloc]init];
    pageModel1.title = @"30天商业中文速成";
    pageModel1.action = CS_Page_Type_Action;
    pageModel1.pageType = CS_Page_Type_Home_moreClassListDetail;
    singleModel.pageModel = pageModel1;
    [self.arr_lesson addObject:singleModel];
    
    
    CSHomeItemsCellModel *itemsModel = [[CSHomeItemsCellModel alloc]init];
    itemsModel.cellName = @"CSHomeItemsCell";
    itemsModel.cellHeight = 160;
    [self.arr_lesson addObject:itemsModel];
    CSHomeItemSingleCellModel *model1 = [[CSHomeItemSingleCellModel alloc]init];
    model1.title = @"茶文化";
    model1.imgName = @"home_cell_mark_teaCulture";
    model1.bgColor = 0x559F3A;
    CSPageTypeModel *pageModel2 = [[CSPageTypeModel alloc]init];
    pageModel2.title = @"茶文化";
    pageModel2.action = CS_Page_Type_Action;
    pageModel2.pageType = CS_Page_Type_Home_moreClassListDetail;
    model1.pageModel = pageModel2;
    
    
    CSHomeItemSingleCellModel *model2 = [[CSHomeItemSingleCellModel alloc]init];
    model2.title = @"诗词";
    model2.imgName = @"home_cell_mark_poetry";
    model2.bgColor = 0x6C80A8;
    CSPageTypeModel *pageModel3 = [[CSPageTypeModel alloc]init];
    pageModel3.title = @"诗词";
    pageModel3.action = CS_Page_Type_Action;
    pageModel3.pageType = CS_Page_Type_Home_moreClassListDetail;
    model2.pageModel = pageModel3;
    
    CSHomeItemSingleCellModel *model3 = [[CSHomeItemSingleCellModel alloc]init];
    model3.title = @"成语";
    model3.imgName = @"home_cell_mark_proverb";
    model3.bgColor = 0x3BB2BC;
    CSPageTypeModel *pageModel4 = [[CSPageTypeModel alloc]init];
    pageModel4.title = @"成语";
    pageModel4.action = CS_Page_Type_Action;
    pageModel4.pageType = CS_Page_Type_Home_moreClassListDetail;
    model3.pageModel = pageModel4;
    
    NSArray * itemsArr = @[model1,model2,model3];
    itemsModel.extparam = itemsArr;
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
