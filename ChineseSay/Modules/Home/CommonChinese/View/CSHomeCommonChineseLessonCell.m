//
//  CSHomeCommonChineseLessonCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/25.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeCommonChineseLessonCell.h"
@interface CSHomeCommonChineseLessonCell()
@property (nonatomic, strong) UIImageView *imgCenterLine;
@property (nonatomic, strong) UIView *viewContent;
@property (nonatomic, strong) UILabel *labelContent;
@property (nonatomic, strong) UIView *viewTitles;
@property (nonatomic, strong) UIImageView *imgTitlesBg;
@property (nonatomic, strong) UIImageView *imgPortrait;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelSubtitle;
@end
@implementation CSHomeCommonChineseLessonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)layoutSubviews{
    [self.imgCenterLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(16);
        make.top.mas_equalTo(-5);
        make.bottom.mas_equalTo(5);
    }];
}
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    self.model = model;
    [self.imgPortrait sd_setImageWithURL:[NSURL URLWithString:self.model.thumbImage]];
    self.labelTitle.text = self.model.lessonTitle;
    self.labelSubtitle.text = self.model.subTitle;
    self.labelContent.text = self.model.lessonDescription;
    
    
    if(path.row % 2 == 0){
        [self layout1];
    }else{
        [self layout2];
    }
}
- (void)layout1{
    [self.viewContent mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(self.imgCenterLine.mas_left).offset(-9);
        make.bottom.mas_equalTo(-16);
    }];
    [self.labelContent mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.right.mas_equalTo(-8);
        make.top.mas_equalTo(9);
    }];
    [self.viewTitles mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgCenterLine.mas_right).offset(0);
        make.right.mas_equalTo(9);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-16);
    }];
    self.imgTitlesBg.image = [UIImage imageNamed:@"home_lesson_cell_rightBG1"];
    [self.imgTitlesBg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(2);
        make.right.mas_equalTo(-10);
        make.bottom.top.mas_equalTo(0);
    }];
    [self.imgPortrait mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(21);
        make.top.mas_equalTo(24);
        make.width.height.mas_equalTo(35);
    }];
    [self.labelTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgPortrait.mas_right).offset(10);
        make.top.mas_equalTo(20);
    }];
    [self.labelSubtitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgPortrait.mas_right).offset(10);
        make.top.mas_equalTo(self.labelTitle.mas_bottom).offset(5);
    }];

}
- (void)layout2{
    [self.viewTitles mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(6);
        make.right.mas_equalTo(self.imgCenterLine.mas_left).offset(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-16);
    }];
    self.imgTitlesBg.image = [UIImage imageNamed:@"home_lesson_cell_leftBG2"];
    [self.imgTitlesBg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    [self.imgPortrait mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(24);
        make.width.height.mas_equalTo(35);
    }];
    [self.labelTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.imgPortrait.mas_left).offset(-10);
        make.top.mas_equalTo(20);
    }];
    [self.labelSubtitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.imgPortrait.mas_left).offset(-10);
        make.top.mas_equalTo(self.labelTitle.mas_bottom).offset(5);
    }];
    [self.viewContent mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(self.imgCenterLine.mas_right).offset(9);
        make.bottom.mas_equalTo(-16);
    }];
    [self.labelContent mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.right.mas_equalTo(-8);
        make.top.mas_equalTo(9);
    }];
}
- (void)createUI{
    [self.contentView addSubview:self.imgCenterLine];
    [self.contentView addSubview:self.viewContent];
    [self.contentView addSubview:self.viewTitles];
}

#pragma mark - lzay load
-(UIImageView *)imgCenterLine{
    if(!_imgCenterLine){
        _imgCenterLine = [[UIImageView alloc]init];
        _imgCenterLine.image = [UIImage imageNamed:@"home_lesson_cell_centerLine"];
    }
    return _imgCenterLine;
}
- (UIView *)viewContent{
    if(!_viewContent){
        _viewContent = [[UIView alloc]init];
        _viewContent.backgroundColor = [UIColor whiteColor];
        _viewContent.layer.borderColor = [UIColor colorWithHex:0xEEEEEE].CGColor;
        _viewContent.layer.borderWidth = 1;
        _viewContent.layer.cornerRadius =10;
        
        [_viewContent addSubview:self.labelContent];
    }
    return _viewContent;
}
- (UILabel *)labelContent{
    if(!_labelContent){
        _labelContent = [[UILabel alloc]init];
        _labelContent.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _labelContent.textColor = [UIColor colorWithHex:0x999999];
        _labelContent.text = @"成熟品牌体系 迅速建立启蒙段产品优势 后期轻松过渡专业课";
        _labelContent.numberOfLines = 3;
    }
    return _labelContent;
}
- (UIView *)viewTitles{
    if(!_viewTitles){
        _viewTitles = [[UIView alloc]init];
        
        [_viewTitles addSubview:self.imgTitlesBg];
        [_viewTitles addSubview:self.imgPortrait];
        [_viewTitles addSubview:self.labelTitle];
        [_viewTitles addSubview:self.labelSubtitle];
    }
    return _viewTitles;
}
- (UIImageView *)imgTitlesBg{
    if(!_imgTitlesBg){
        _imgTitlesBg = [[UIImageView alloc]init];
        _imgTitlesBg.image = [UIImage imageNamed:@"home_lesson_cell_rightBG1"];
    }
    return _imgTitlesBg;
}
- (UIImageView *)imgPortrait{
    if(!_imgPortrait){
        _imgPortrait = [[UIImageView alloc]init];
        _imgPortrait.image = [UIImage imageNamed:@""];
        _imgPortrait.backgroundColor = [UIColor blueColor];
    }
    return _imgPortrait;
}
- (UILabel *)labelTitle{
    if(!_labelTitle){
        _labelTitle = [[UILabel alloc]init];
        _labelTitle.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _labelTitle.textColor = [UIColor colorWithHex:0xFFFFFF];
        _labelTitle.text = @"LESSON-1";
    }
    return _labelTitle;
}
- (UILabel *)labelSubtitle{
    if(!_labelSubtitle){
        _labelSubtitle = [[UILabel alloc]init];
        _labelSubtitle.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _labelSubtitle.textColor = [UIColor colorWithHex:0xF999999];
        _labelSubtitle.text = @"副文案";
    }
    return _labelSubtitle;
}
@end
