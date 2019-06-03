//
//  CSHomeItemsCellItem.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/3.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeItemsCellItem.h"
@interface CSHomeItemsCellItem()
@property (nonatomic, strong) UIImageView *img_bg;
@property (nonatomic, strong) UIImageView *img_mark;
@property (nonatomic, strong) UILabel *label_title;
@end
@implementation CSHomeItemsCellItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    [self addSubview:self.img_bg];
    [self addSubview:self.img_mark];
    [self addSubview:self.label_title];
}
- (void)setModel:(CSHomeItemSingleCellModel *)model{
    _model = model;
    self.img_bg.backgroundColor = [UIColor colorWithHex:model.bgColor];
    self.img_mark.image = [UIImage imageNamed:model.imgName];
    self.label_title.text = model.title;
}
- (void)layoutSubviews{
    [self.img_bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [self.img_mark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(-17);
        make.width.height.mas_equalTo(34);
    }];
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
    }];
}
#pragma mark -- lazy
- (UIImageView *)img_bg{
    if(!_img_bg){
        _img_bg =[[UIImageView alloc]init];
        _img_bg.layer.cornerRadius = 10;
    }
    return _img_bg;
}
- (UIImageView *)img_mark{
    if(!_img_mark){
        _img_mark = [[UIImageView alloc]init];
    }
    return _img_mark;
}
- (UILabel *)label_title{
    if(!_label_title){
        _label_title = [[UILabel alloc]init];
        _label_title.font = [UIFont boldSystemFontOfSize:15];
        _label_title.textColor = [UIColor whiteColor];
        _label_title.textAlignment = NSTextAlignmentCenter;
    }
    return _label_title;
}
- (CGFloat)width{
    if(_width == 0){
        _width = (kScreenWidth - 10 - 11 - 11 - 10)/3.0;
    }
    return _width;
}
- (CGFloat)height{
    if(!_height){
        _height = 140;
    }
    return _height;
}
@end
