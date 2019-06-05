//
//  CSHomeMoreLessonListCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/5.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeMoreLessonListCell.h"
#import "CSHomeItemSingleCellModel.h"
@interface CSHomeMoreLessonListCell()
@property (nonatomic, strong) UIView *view_bg;
@property (nonatomic, strong) UIImageView *img_headBg;
@property (nonatomic, strong) UIImageView *img_mark;
@property (nonatomic, strong) UILabel *label_title;
@end
@implementation CSHomeMoreLessonListCell
#pragma mark - assist method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    CSHomeItemSingleCellModel *itemModel = (CSHomeItemSingleCellModel *)model;
    self.img_mark.image = [UIImage imageNamed:itemModel.imgName];
    self.img_headBg.backgroundColor = [UIColor colorWithHex:itemModel.bgColor];
    self.label_title.text = itemModel.title;
}
- (void)layoutSubviews{
    [self.view_bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-10);
    }];
    [self.img_headBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(100);
    }];
    [self.img_mark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(34);
        make.centerY.centerX.mas_equalTo(self.img_headBg).offset(0);
    }];
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.img_headBg.mas_right).offset(15);
        make.centerY.mas_equalTo(0);
    }];
}

#pragma mark - private
- (void)createUI{
    self.contentView.backgroundColor = [UIColor colorWithHex:0xF4F5F9];
    [self.contentView addSubview:self.view_bg];
}

#pragma mark - lazy load
- (UIView *)view_bg{
    if(!_view_bg){
        _view_bg = [[UIView alloc]init];
        _view_bg.backgroundColor = [UIColor whiteColor];
        [_view_bg addSubview:self.img_headBg];
        [_view_bg addSubview:self.img_mark];
        [_view_bg addSubview:self.label_title];
    }
    return _view_bg;
}
- (UIImageView *)img_headBg{
    if(!_img_headBg){
        _img_headBg = [[UIImageView alloc]init];
        _img_headBg.layer.cornerRadius = 10;
        _img_headBg.backgroundColor = [UIColor colorWithHex:0x559F3A];
    }
    return _img_headBg;
}
- (UIImageView *)img_mark{
    if(!_img_mark){
        _img_mark = [[UIImageView alloc]init];
        _img_mark.image = [UIImage imageNamed:@"home_cell_mark_lesson"];
    }
    return _img_mark;
}
- (UILabel *)label_title{
    if(!_label_title){
        _label_title = [[UILabel alloc]init];
        _label_title.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
        _label_title.textColor = [UIColor colorWithHex:0x333333];
        _label_title.text = @"茶文化";
    }
    return _label_title;
}
@end
