//
//  CSHomeChinesePlaceDetailCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/11.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeChinesePlaceDetailCell.h"
@interface CSHomeChinesePlaceDetailCell()
@property (nonatomic, strong) UILabel *label_placeName;
@property (nonatomic, strong) UILabel *label_placeEnglishName;
@property (nonatomic, strong) UILabel *label_placeDes;
@property (nonatomic, strong) UIImageView *img_content;
@property (nonatomic, strong) UILabel *label_foodPinyin;
@property (nonatomic, strong) UILabel *label_foodName;
@property (nonatomic, strong) UIButton *btn_play;
@property (nonatomic, strong) UILabel *label_foodTitle;
@property (nonatomic, strong) UILabel *label_foodDes;

@property (nonatomic, strong) UIScrollView *scrollView;
@end
#pragma mark - assist method
@implementation CSHomeChinesePlaceDetailCell
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createUI];
    }
    return self;
}
- (void)setModel:(CSHomePlaceDetailModel *)model {
    _model = model;
    
    self.label_placeName.text = model.title;
    self.label_placeEnglishName.text = model.subTitle;
    self.label_placeDes.text = model.shortDesc;
    [self.img_content sd_setImageWithURL:[NSURL URLWithString:model.image]];
    self.label_foodPinyin.text = model.specialPinyin;
    self.label_foodName.text = model.specialNameZh;
    self.label_foodTitle.text = model.specialNameEn;
    self.label_foodDes.text = model.desc;
}
- (void)layoutSubviews{
    CGFloat itemWidth = self.frame.size.width;
    CGFloat itemHeight = self.frame.size.height;
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.with.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(itemWidth);
//        make.height.mas_equalTo(itemHeight);
    }];
    
    [self.label_placeName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(self.frame.size.width - 30);
    }];
    [self.label_placeEnglishName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(self.label_placeName.mas_bottom).offset(5);
    }];
    [self.label_placeDes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(self.label_placeEnglishName.mas_bottom).offset(20);
    }];
    [self.img_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label_placeDes.mas_bottom).offset(20);
        make.width.mas_equalTo(210);
        make.height.mas_equalTo(106);
        make.centerX.mas_equalTo(0);
    }];
    [self.label_foodPinyin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(self.img_content.mas_bottom).offset(20);
    }];
    [self.label_foodName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-100);
        make.top.mas_equalTo(self.label_foodPinyin.mas_bottom).offset(3);
    }];
    [self.btn_play mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-78);
        make.width.height.mas_equalTo(20);
        make.centerY.mas_equalTo(self.label_foodName.mas_centerY).offset(0);
    }];
    [self.label_foodTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(self.label_foodName.mas_bottom).offset(5);
    }];
    [self.label_foodDes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(self.label_foodTitle.mas_bottom).offset(20);
        make.bottom.mas_equalTo(-20);
    }];
}


- (void)createUI{
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 10;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.label_placeName];
    [self.scrollView addSubview:self.label_placeEnglishName];
    [self.scrollView addSubview:self.label_placeDes];
    [self.scrollView addSubview:self.img_content];
    [self.scrollView addSubview:self.label_foodPinyin];
    [self.scrollView addSubview:self.label_foodName];
    [self.scrollView addSubview:self.btn_play];
    [self.scrollView addSubview:self.label_foodTitle];
    [self.scrollView addSubview:self.label_foodDes];

}
#pragma mark - lazy load

- (UIScrollView *)scrollView {
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UILabel *)label_placeName{
    if(!_label_placeName){
        _label_placeName = [[UILabel alloc]init];
        _label_placeName.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:30];
        _label_placeName.textColor = [UIColor colorWithHex:0x333333];
        _label_placeName.numberOfLines = 0;
        _label_placeName.text = @"西南地区";
    }
    return _label_placeName;
}
- (UILabel *)label_placeEnglishName{
    if(!_label_placeEnglishName){
        _label_placeEnglishName = [[UILabel alloc]init];
        _label_placeEnglishName.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:25];
        _label_placeEnglishName.textColor = [UIColor colorWithHex:0x333333];
        _label_placeEnglishName.text = @"Southwest China";
        _label_placeEnglishName.numberOfLines = 0;
    }
    return _label_placeEnglishName;
}
- (UILabel *)label_placeDes{
    if(!_label_placeDes){
        _label_placeDes = [[UILabel alloc]init];
        _label_placeDes.font = [UIFont fontWithName:@"ArialMT" size:15];
        _label_placeDes.textColor = [UIColor colorWithHex:0x555555];
        _label_placeDes.numberOfLines = 0;
        _label_placeDes.text = @"Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.";
    }
    return _label_placeDes;
}
- (UIImageView *)img_content{
    if(!_img_content){
        _img_content =[[UIImageView alloc]init];
        _img_content.backgroundColor = [UIColor colorWithHex:0xB7BED1];
        _img_content.layer.cornerRadius = 10;
    }
    return _img_content;
}
- (UILabel *)label_foodPinyin{
    if(!_label_foodPinyin){
        _label_foodPinyin = [[UILabel alloc]init];
        _label_foodPinyin.font = [UIFont fontWithName:@"ArialMT" size:10];
        _label_foodPinyin.textColor = [UIColor colorWithHex:0x333333];
        _label_foodPinyin.textAlignment = NSTextAlignmentCenter;
        _label_foodPinyin.text = @"huo  guo";
        _label_foodPinyin.numberOfLines = 0;
    }
    return _label_foodPinyin;
}
- (UILabel *)label_foodName{
    if(!_label_foodName){
        _label_foodName = [[UILabel alloc]init];
        _label_foodName.font = [UIFont fontWithName:@"PingFangSC-Medium" size:25];
        _label_foodName.textColor = [UIColor colorWithHex:0x333333];
        _label_foodName.textAlignment = NSTextAlignmentCenter;
        _label_foodName.text = @"火  锅";
        _label_foodName.numberOfLines = 0;
    }
    return _label_foodName;
}
- (UILabel *)label_foodTitle{
    if(!_label_foodTitle){
        _label_foodTitle = [[UILabel alloc]init];
        _label_foodTitle.font = [UIFont fontWithName:@"Arial-ItalicMT" size:20];
        _label_foodTitle.textColor = [UIColor colorWithHex:0x333333];
        _label_foodTitle.textAlignment = NSTextAlignmentCenter;
        _label_foodTitle.text = @"Greatwall";
        _label_foodTitle.numberOfLines = 0;
    }
    return _label_foodTitle;
}
- (UILabel *)label_foodDes{
    if(!_label_foodDes){
        _label_foodDes = [[UILabel alloc]init];
        _label_foodDes.font = [UIFont fontWithName:@"ArialMT" size:15];
        _label_foodDes.textColor = [UIColor colorWithHex:0x555555];
        _label_foodDes.numberOfLines = 0;
        _label_foodDes.text = @"Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However.";
    }
    return _label_foodDes;
}
- (UIButton *)btn_play{
    if(!_btn_play){
        _btn_play = [UIButton buttonWithType:UIButtonTypeCustom];
//        _btn_play.backgroundColor =[UIColor lightGrayColor];
        [_btn_play setImage:[UIImage imageNamed:@"home_cultureDetail_playSound"] forState:UIControlStateNormal];
    }
    return _btn_play;
}

@end
