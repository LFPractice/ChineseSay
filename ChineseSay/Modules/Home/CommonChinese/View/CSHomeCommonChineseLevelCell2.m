//
//  CSHomeCommonChineseLevelCell2.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/25.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeCommonChineseLevelCell2.h"
@interface CSHomeCommonChineseLevelCell2()
@property (nonatomic, strong) CSHomeLevelModel*model;
@property (nonatomic, strong) UIImageView *imgBg;
@property (nonatomic, strong) UILabel *labelTitle;
@end
@implementation CSHomeCommonChineseLevelCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    self.model = model;
    [self.imgBg sd_setImageWithURL:[NSURL URLWithString:self.model.levelImage]];
    self.labelTitle.text = self.model.levelName;
}

- (void)layoutSubviews{
    [self.imgBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-10);
    }];
    [self.labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.imgBg).offset(0);
    }];
}

- (void)createUI{
    [self.contentView addSubview:self.imgBg];
    [self.contentView addSubview:self.labelTitle];
}

#pragma mark - lazy load
- (UIImageView *)imgBg{
    if(!_imgBg){
        _imgBg = [[UIImageView alloc]init];
//        _imgBg.backgroundColor = [UIColor blueColor];
    }
    return _imgBg;
}
- (UILabel *)labelTitle{
    if(!_labelTitle){
        _labelTitle = [[UILabel alloc]init];
        _labelTitle.font = [UIFont boldSystemFontOfSize:17];
        _labelTitle.textColor = [UIColor whiteColor];
        _labelTitle.text = @"Level 1";
    }
    return _labelTitle;
}
@end
