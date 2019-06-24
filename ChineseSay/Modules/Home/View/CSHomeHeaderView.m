//
//  CSHomeHeaderView.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/9.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeHeaderView.h"
#import "CSHomeBannerModel.h"
@interface CSHomeHeaderView()
@property (nonatomic, strong)SDCycleScrollView *cycleScrollView;
@end
@implementation CSHomeHeaderView

#pragma mark - assist method
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)reloadData{
    NSMutableArray *imgUrlsArr = [[NSMutableArray alloc]init];
    for (int i =0; i < [CSHomeDataSource shareInstance].arr_topBanner.count; i++) {
        CSHomeBannerModel *model = [CSHomeDataSource shareInstance].arr_topBanner[i];
        [imgUrlsArr addObject:model.imageUrl];
    }
    self.cycleScrollView.imageURLStringsGroup = imgUrlsArr;
}

#pragma mark - private
- (void)createUI{
    [self addSubview:self.cycleScrollView];
}
#pragma mark - lazy load
- (SDCycleScrollView *)cycleScrollView{
    if(!_cycleScrollView){
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, 214) delegate:nil placeholderImage:nil];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    }
    return _cycleScrollView;
}
@end
