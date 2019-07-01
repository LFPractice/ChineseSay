//
//  CSMineHeaderView.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/15.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineHeaderView.h"
#import "CSMineHeaderItemView.h"
@interface CSMineHeaderView()
@property (nonatomic, strong) UIImageView *img_headerBg;
@property (nonatomic, strong) UIImageView *img_portrait; //头像
@property (nonatomic, strong) UILabel *label_name;
@property (nonatomic, strong) UILabel *label_userID;
@property (nonatomic, strong) UIImageView *img_infoNextMark;
@property (nonatomic, strong) UILabel *label_userCenter_title;
@property (nonatomic, strong) CSMineHeaderItemView *item_jiFen; // 积分
@property (nonatomic, strong) CSMineHeaderItemView *item_vipDays; // 会员剩余天数
@property (nonatomic, strong) CSMineHeaderItemView *item_Coupons; // 优惠券
@end
@implementation CSMineHeaderView

#pragma mark - assist method
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)setUserInfoModel:(CSUserInfoModel *)userInfoModel{
    _userInfoModel = userInfoModel;
    self.label_name.text = userInfoModel.account;
    _item_jiFen.label_count.text = userInfoModel.score.stringValue;
    _item_vipDays.label_count.text = userInfoModel.vipLeft.stringValue;
    _item_Coupons.label_count.text = userInfoModel.couponCount.stringValue;
    
}
- (void)layoutSubviews{
    [self.img_headerBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(184);
    }];
    
    [self.img_portrait mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(74);
        make.width.height.mas_equalTo(70);
    }];
    
    [self.label_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.img_portrait.mas_right).offset(10);
        make.centerY.mas_equalTo(self.img_portrait.mas_centerY).offset(0);
    }];
//    [self.label_userID mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.img_portrait.mas_right).offset(10);
//        make.top.mas_equalTo(self.label_name.mas_bottom).offset(9);
//    }];
    
    [self.img_infoNextMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.width.height.mas_equalTo(12);
        make.centerY.mas_equalTo(self.img_portrait.mas_centerY).offset(0);
    }];
    
    [self.label_userCenter_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.img_headerBg.mas_bottom).offset(10);
    }];
    _item_jiFen.frame = CGRectMake(0, self.frame.size.height - _item_jiFen.height, _item_jiFen.width, _item_jiFen.height);
    _item_vipDays.frame = CGRectMake(_item_vipDays.width, self.frame.size.height - _item_vipDays.height, _item_vipDays.width, _item_vipDays.height);
    _item_Coupons.frame = CGRectMake(_item_Coupons.width * 2, self.frame.size.height - _item_Coupons.height, _item_Coupons.width, _item_Coupons.height);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.turnToUserInfoDetail){
        self.turnToUserInfoDetail();
    }
}

#pragma mark - private
- (void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.img_headerBg];
    [self addSubview:self.img_portrait];
    [self addSubview:self.label_name];
    [self addSubview:self.label_userID];
    [self addSubview:self.img_infoNextMark];
    [self addSubview:self.label_userCenter_title];
    
    [self addSubview:self.item_jiFen];
    [self addSubview:self.item_vipDays];
    [self addSubview:self.item_Coupons];
}

#pragma mark - lazy load
- (UIImageView *)img_headerBg{
    if(!_img_headerBg){
        _img_headerBg = [[UIImageView alloc]init];
        _img_headerBg.image = [UIImage imageNamed:@"mine_headerBg"];
    }
    return _img_headerBg;
}
- (UIImageView *)img_portrait{
    if(!_img_portrait){
        _img_portrait = [[UIImageView alloc]init];
        _img_portrait.image = [UIImage imageNamed:@""];
        _img_portrait.layer.cornerRadius = 35;
        _img_portrait.backgroundColor = [UIColor colorWithHex:0xB7BED1];
    }
    return _img_portrait;
}
- (UILabel *)label_name{
    if(!_label_name){
        _label_name = [[UILabel alloc]init];
        _label_name.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18];
        _label_name.textColor = [UIColor colorWithHex:0xffffff];
        _label_name.text = @"MOMO";
    }
    return _label_name;
}
- (UILabel *)label_userID{
    if(!_label_userID){
        _label_userID = [[UILabel alloc]init];
        _label_userID.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _label_userID.textColor = [UIColor colorWithHex:0xffffff];
        _label_userID.text = @"UserID：2388988";
    }
    return _label_userID;
}
- (UIImageView *)img_infoNextMark{
    if(!_img_infoNextMark){
        _img_infoNextMark = [[UIImageView alloc]init];
        _img_infoNextMark.image = [UIImage imageNamed:@"mine_header_infoNextMark"];
    }
    return _img_infoNextMark;
}
- (UILabel *)label_userCenter_title{
    if(!_label_userCenter_title){
        _label_userCenter_title = [[UILabel alloc]init];
        _label_userCenter_title.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
        _label_userCenter_title.textColor = [UIColor colorWithHex:0x333333];
        _label_userCenter_title.text = @"会员中心";
    }
    return _label_userCenter_title;
}
- (CSMineHeaderItemView *)item_jiFen{
    if(!_item_jiFen){
        _item_jiFen = [[CSMineHeaderItemView alloc]init];
        _item_jiFen.frame = CGRectMake(0, self.frame.size.height - _item_jiFen.height, _item_jiFen.width, _item_jiFen.height);
        _item_jiFen.label_count.text = @"235";
        _item_jiFen.label_title.text = @"积分商城";
        _item_jiFen.label_des.text = @"立即签到领积分";
        _item_jiFen.view_verticalLine.hidden = YES;
    }
    return _item_jiFen;
}
- (CSMineHeaderItemView *)item_vipDays{
    if(!_item_vipDays){
        _item_vipDays = [[CSMineHeaderItemView alloc]init];
        _item_vipDays.frame = CGRectMake(_item_vipDays.width, self.frame.size.height - _item_vipDays.height, _item_vipDays.width, _item_vipDays.height);
        _item_vipDays.label_count.text = @"329";
        _item_vipDays.label_title.text = @"会员剩余天数";
        _item_vipDays.view_verticalLine.hidden = YES;
        _item_vipDays.label_des.text = @"充值";
    }
    return _item_vipDays;
}
- (CSMineHeaderItemView *)item_Coupons{
    if(!_item_Coupons){
        _item_Coupons = [[CSMineHeaderItemView alloc]init];
        _item_Coupons.frame = CGRectMake(_item_Coupons.width * 2, self.frame.size.height - _item_Coupons.height, _item_Coupons.width, _item_Coupons.height);
        _item_Coupons.label_count.text = @"8";
        _item_Coupons.label_title.text = @"我的优惠券";
        _item_Coupons.view_verticalLine.hidden = YES;
        _item_Coupons.view_verticalLine.hidden = YES;
    }
    return _item_Coupons;
}
@end
