//
//  CSHomeMoreLessonDetailCollectionViewCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/6.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeMoreLessonDetailCollectionViewCell.h"
@interface CSHomeMoreLessonDetailCollectionViewCell()
@property (nonatomic, strong) UIImageView *img_head;
@property (nonatomic, strong) UILabel *label_title;
@property (nonatomic, strong) UILabel *label_englishTitle;
@property (nonatomic, strong) UIButton *btn_play;
@property (nonatomic, strong) UILabel *label_content;
@end
@implementation CSHomeMoreLessonDetailCollectionViewCell
#pragma mark - assist method
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createUI];
    }
    return self;
}
- (void)loadData:(CSHomeMoreLessonListDetailItemModel *)model indexPath:(NSIndexPath *)indexPath{
    [self.img_head sd_setImageWithURL:[NSURL URLWithString:model.image]];
    self.label_title.text = model.title;
    self.label_englishTitle.text = model.subTitle;
    self.label_content.text = model.content;
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.img_head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(180);
    }];
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(self.img_head.mas_bottom).offset(30);
        make.height.mas_equalTo(35);
    }];
    
    [self.label_englishTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(self.label_title.mas_bottom).offset(10);
        make.height.mas_equalTo(22);
    }];
    [self.btn_play mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.width.height.mas_equalTo(30);
        make.centerY.mas_equalTo(self.label_title.mas_centerY).offset(0);
    }];
    [self.label_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(self.label_englishTitle.mas_bottom).offset(30);
//        make.bottom.mas_equalTo(-21);
    }];
}
#pragma mark - private
- (void)createUI{
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 10;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.img_head];
    [self.contentView addSubview:self.label_title];
    [self.contentView addSubview:self.label_englishTitle];
    [self.contentView addSubview:self.btn_play];
    [self.contentView addSubview:self.label_content];
}

#pragma mark -- lazy load
- (UIImageView *)img_head{
    if(!_img_head){
        _img_head = [[UIImageView alloc]init];
        _img_head.backgroundColor =[UIColor colorWithHex:0xB7BED1];
    }
    return _img_head;
}
- (UILabel *)label_title{
    if(!_label_title){
        _label_title = [[UILabel alloc]init];
        _label_title.textColor = [UIColor colorWithHex:0x333333];
        _label_title.font = [UIFont fontWithName:@"PingFangSC-Medium" size:25];
        _label_title.text = @"诗词文化";
    }
    return _label_title;
}
- (UILabel *)label_englishTitle{
    if(!_label_englishTitle){
        _label_englishTitle = [[UILabel alloc]init];
        _label_englishTitle.textColor = [UIColor colorWithHex:0x333333];
        _label_englishTitle.font = [UIFont fontWithName:@"Arial-ItalicMT" size:20];
        _label_englishTitle.numberOfLines = 1;
        _label_englishTitle.text = @"Poetry Culture";
    }
    return _label_englishTitle;
}
- (UIButton *)btn_play{
    if(!_btn_play){
        _btn_play = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn_play.backgroundColor =[UIColor lightGrayColor];
    }
    return _btn_play;
}
- (UILabel *)label_content{
    if(!_label_content){
        _label_content = [[UILabel alloc]init];
        _label_content.font = [UIFont systemFontOfSize:15];// [UIFont fontWithName:@"ArialMT" size:15];
        _label_content.textColor = [UIColor colorWithHex:0x555555];
        _label_content.numberOfLines = 0;
        _label_content.text = @"Classical poem is the cream that spread from Chinese thousands of years culture, is supporting body of Chinese ethnic spirit.However, classic Chinese poetry, as the treasure of Chinese culture as well as a bright pearl in the treasure house of world culture, has been passed down and widely and unceasingly read from generation to generation for thousands of years. China classical poetry, inheriting the soul of the traditional culture. ";
    }
    return _label_content;
}
@end
