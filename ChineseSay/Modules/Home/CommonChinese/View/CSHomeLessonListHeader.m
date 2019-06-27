//
//  CSHomeLessonListHeader.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/25.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeLessonListHeader.h"
@interface CSHomeLessonListHeader()
@property (nonatomic, strong) UIImageView *imgBg;
@property (nonatomic, strong) UIImageView *imgPortrait;
@property (nonatomic, strong) UILabel *labelLevel;
@property (nonatomic, strong) UILabel *labelLevelMark;
@property (nonatomic, strong) UIView *viewCenterLine;
@end
@implementation CSHomeLessonListHeader

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)setLevel:(NSString *)level{
    _level = level;
    self.labelLevel.text = level;
}
- (void)layoutSubviews{
    [self.imgBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(180);
    }];
    [self.imgPortrait mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(150);
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(self.imgBg.mas_bottom).offset(0);
    }];
    [self.labelLevel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(self.imgPortrait.mas_centerY).offset(0);
    }];
    [self.labelLevelMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.labelLevel.mas_bottom).offset(10);
    }];
//    [self.viewCenterLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(0);
//        make.top.mas_equalTo(self.imgPortrait.mas_bottom).offset(-20);
//        make.bottom.mas_equalTo(0);
//        make.width.mas_equalTo(3);
//    }];
}

- (void)createUI{
    [self addSubview:self.imgBg];
    [self addSubview:self.imgPortrait];
    [self addSubview:self.labelLevel];
    [self addSubview:self.labelLevelMark];
    [self addSubview:self.viewCenterLine];
}

#pragma mark - lazy load
- (UIImageView *)imgBg{
    if(!_imgBg){
        _imgBg = [[UIImageView alloc]init];
        _imgBg.image = [UIImage imageNamed:@"home_lesson_header_bg"];
    }
    return _imgBg;
}
- (UIImageView *)imgPortrait{
    if(!_imgPortrait){
        _imgPortrait = [[UIImageView alloc]init];
        _imgPortrait.image = [UIImage imageNamed:@"home_lesson_header_portrait"];
    }
    return _imgPortrait;
}
- (UILabel *)labelLevel{
    if(!_labelLevel){
        _labelLevel = [[UILabel alloc]init];
        _labelLevel.font = [UIFont boldSystemFontOfSize:40];
        _labelLevel.textColor = [UIColor colorWithHex:0x282828];
        _labelLevel.text = @"12";
    }
    return _labelLevel;
}
- (UILabel *)labelLevelMark{
    if(!_labelLevelMark){
        _labelLevelMark = [[UILabel alloc]init];
        _labelLevelMark.font = [UIFont fontWithName:@"DIN-Bold" size:15];
        _labelLevelMark.textColor = [UIColor colorWithHex:0x666666];
        _labelLevelMark.text = @"LEVEL";
    }
    return _labelLevelMark;
}
- (UIView *)viewCenterLine{
    if(!_viewCenterLine){
        _viewCenterLine = [[UIView alloc]init];
        _viewCenterLine.backgroundColor = [UIColor colorWithHex:0x202020];
    }
    return _viewCenterLine;
}
@end
