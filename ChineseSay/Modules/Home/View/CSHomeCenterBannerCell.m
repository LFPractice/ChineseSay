//
//  CSHomeCenterBannerCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/24.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeCenterBannerCell.h"
#import "CSHomeBannerModel.h"
@interface CSHomeCenterBannerCell()<SDCycleScrollViewDelegate>
@property (nonatomic, strong)SDCycleScrollView *cycleScrollView;
@end
@implementation CSHomeCenterBannerCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    NSMutableArray *imgUrlsArr = [[NSMutableArray alloc]init];
    for (int i =0; i < [CSHomeDataSource shareInstance].arr_centerBanner.count; i++) {
        CSHomeBannerModel *model = [CSHomeDataSource shareInstance].arr_centerBanner[i];
        [imgUrlsArr addObject:model.imageUrl];
    }
    self.cycleScrollView.imageURLStringsGroup = imgUrlsArr;
    self.cycleScrollView.frame = CGRectMake(10, 10, self.bounds.size.width - 20, self.bounds.size.height - 20);
}

#pragma mark - delegate
#pragma mark ------ SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    CSPageTypeModel *model = [[CSPageTypeModel alloc]init];
    model.pageType = CS_Page_Type_Home_EssayList;
    model.action = CS_Page_Type_Action;
    [[CSPageTransfer shareInstance]dispatchTransFerActionWithPageModel:model];
}

#pragma mark - private
- (void)createUI{
    [self.contentView addSubview:self.cycleScrollView];
}

#pragma mark - lazy load
- (SDCycleScrollView *)cycleScrollView{
    if(!_cycleScrollView){
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:nil];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor];
        _cycleScrollView.delegate = self;
    }
    return _cycleScrollView;
}

@end
