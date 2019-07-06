//
//  CSMineJiFenShopController.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/4.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineJiFenShopController.h"
#import "CSMineJiFenShopItemView.h"
#import "CSMineGetJiFenController.h"
#import "CSMineChineseNameController.h"
#import "CSChieseGiftController.h"
#import "CSMineJiFenShopModel.h"
@interface CSMineJiFenShopController ()
@property (weak, nonatomic) IBOutlet UIImageView *headerBgImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *getScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *nextImg;

@property (strong, nonatomic) CSMineJiFenShopItemView *vipDayItem;
@property (strong, nonatomic) CSMineJiFenShopItemView *chineseNameItem;
@property (strong, nonatomic) CSMineJiFenShopItemView *chineseGiftItem;
@property (strong, nonatomic) CSMineJiFenShopItemView *vipWeekItem;

@property (strong, nonatomic) CSMineJiFenShopItemModel *vipDayModel;
@property (strong, nonatomic) CSMineJiFenShopItemModel *chineseNameModel;
@property (strong, nonatomic) CSMineJiFenShopItemModel *chineseGiftModel;
@property (strong, nonatomic) CSMineJiFenShopItemModel *vipWeekModel;
@property (strong, nonatomic) CSMineJiFenShopModel *infoModel;
@end

@implementation CSMineJiFenShopController
{
    CGFloat itemWidth;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithHex:0xF4F5F9]];
    itemWidth = (kScreenWidth - 20 - 20 - 20) / 2;
    [self.view addSubview:self.vipDayItem];
    [self.view addSubview:self.chineseNameItem];
    [self.view addSubview:self.chineseGiftItem];
    [self.view addSubview:self.vipWeekItem];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(getJiFenClick)];
    [self.getScoreLabel addGestureRecognizer:tap];
    self.getScoreLabel.userInteractionEnabled = YES;
    
    [self loadData];
}
- (void)getJiFenClick {
    CSMineGetJiFenController *getVC = [[CSMineGetJiFenController alloc]init];
    [self.navigationController pushViewController:getVC animated:YES];
}


- (void)loadData {
    
    [LFHttpTool mine_getuserShopInfoWithParam:@{} Success:^(id responseObject) {
        NSNumber *code = responseObject[@"code"];
        if(code.integerValue == 200) {
            self.infoModel = [CSMineJiFenShopModel mj_objectWithKeyValues:responseObject[@"data"]];
            self.infoModel.list = [CSMineJiFenShopItemModel mj_objectArrayWithKeyValuesArray:self.infoModel.list];
            
            NSArray *tmpArr = @[self.vipDayModel,self.chineseNameModel,self.chineseGiftModel,self.vipWeekModel];
            for(int i=0;i < self.infoModel.list.count; i++) {
                CSMineJiFenShopItemModel *itemModel = tmpArr[i];
                CSMineJiFenShopItemModel *model = self.infoModel.list[i];
                
                itemModel.jiFen = model.jiFen;
                itemModel.category = model.category;
                itemModel.name = model.name;
                itemModel.id = model.id;
            }
            
            self.vipDayItem.model = self.vipDayModel;
            self.chineseNameItem.model = self.chineseNameModel;
            self.chineseGiftItem.model = self.chineseGiftModel;
            self.vipWeekItem.model = self.vipWeekModel;
        }
    } Failure:^(NSError *error) {
        
    }];
    
    
    
}
- (void)viewWillLayoutSubviews{
    [self.headerBgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo((self.navigationController.navigationBar.translucent?(0):-(kSystemNavigationBarHeight + kSystemStatusHeight)));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(184);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerBgImg.mas_top).offset(30);
        make.centerX.mas_equalTo(0);
    }];
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(15);
        make.centerX.mas_equalTo(0);
    }];
    [self.getScoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.scoreLabel.mas_bottom).offset(14);
        make.centerX.mas_equalTo(0);
    }];
    [self.nextImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.getScoreLabel.mas_right).offset(8);
        make.centerY.mas_equalTo(self.getScoreLabel.mas_centerY).offset(0);
        make.width.mas_equalTo(11);
        make.height.mas_equalTo(11);
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setColor:[UIColor clearColor]];
}

- (CSMineJiFenShopItemView *)vipDayItem {
    if(!_vipDayItem) {
        _vipDayItem = [[CSMineJiFenShopItemView alloc]initWithFrame:CGRectMake(20, 204, itemWidth, 120)];
    }
    return _vipDayItem;
}
- (CSMineJiFenShopItemView *)chineseNameItem {
    if(!_chineseNameItem) {
        _chineseNameItem = [[CSMineJiFenShopItemView alloc]initWithFrame:CGRectMake(20 + itemWidth + 20, 204, itemWidth, 120)];
    }
    return _chineseNameItem;
}
- (CSMineJiFenShopItemView *)chineseGiftItem {
    if(!_chineseGiftItem) {
        _chineseGiftItem = [[CSMineJiFenShopItemView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.vipDayItem.frame) + 20, itemWidth, 120)];
    }
    return _chineseGiftItem;
}
- (CSMineJiFenShopItemView *)vipWeekItem {
    if(!_vipWeekItem) {
        _vipWeekItem = [[CSMineJiFenShopItemView alloc]initWithFrame:CGRectMake(20 + itemWidth + 20, CGRectGetMaxY(self.vipDayItem.frame) + 20, itemWidth, 120)];
    }
    return _vipWeekItem;
}

- (CSMineJiFenShopItemModel *)vipDayModel {
    if(!_vipDayModel) {
        _vipDayModel = [[CSMineJiFenShopItemModel alloc]init];
        _vipDayModel.titleName = @"一天免费会员体验";
        _vipDayModel.jiFen = @"200";
        _vipDayItem.actionBlock = ^(NSInteger index) {
          [QMUITips showSucceed:@"领取成功"];
        };
    }
    return _vipDayModel;
}
- (CSMineJiFenShopItemModel *)chineseNameModel {
    if(!_chineseNameModel) {
        _chineseNameModel = [[CSMineJiFenShopItemModel alloc]init];
        _chineseNameModel.titleName = @"免费定制中文名";
        _chineseNameModel.jiFen = @"1000";
        __weak typeof(self)weakSelf = self;
        _chineseNameItem.actionBlock = ^(NSInteger index) {
            CSMineChineseNameController *chineseNameVC = [[CSMineChineseNameController alloc]init];
            [weakSelf.navigationController pushViewController:chineseNameVC animated:YES];
        };
    }
    return _chineseNameModel;
}
- (CSMineJiFenShopItemModel *)chineseGiftModel {
    if(!_chineseGiftModel) {
        _chineseGiftModel = [[CSMineJiFenShopItemModel alloc]init];
        _chineseGiftModel.titleName = @"随机中国特色小礼物";
        _chineseGiftModel.jiFen = @"2000";
        
        __weak typeof(self)weakSelf = self;
        _chineseGiftItem.actionBlock = ^(NSInteger index) {
            CSChieseGiftController *giftVC = [[CSChieseGiftController alloc]init];
            [weakSelf.navigationController pushViewController:giftVC animated:YES];
        };
    }
    return _chineseGiftModel;
}
- (CSMineJiFenShopItemModel *)vipWeekModel {
    if(!_vipWeekModel) {
        _vipWeekModel = [[CSMineJiFenShopItemModel alloc]init];
        _vipWeekModel.titleName = @"一天免费会员体验";
        _vipWeekModel.jiFen = @"200";
        _vipWeekItem.actionBlock = ^(NSInteger index) {
            [QMUITips showSucceed:@"领取成功"];
        };
    }
    return _vipWeekModel;
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
@end
