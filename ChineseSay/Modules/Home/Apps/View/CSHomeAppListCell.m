//
//  CSHomeAppListCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/9.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeAppListCell.h"
@interface CSHomeAppListCell()
@property (nonatomic, strong) UIImageView *img_header;
@property (nonatomic, strong) UILabel *label_name;
@property (nonatomic, strong) UILabel *label_content;
@property (nonatomic, strong) UILabel *label_help;
@end
@implementation CSHomeAppListCell

#pragma mark - assist method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)loadCellWithData:(CSHomeAppModel *)model cellPath:(NSIndexPath *)path{
    [self.img_header sd_setImageWithURL:[NSURL URLWithString:model.image]];
    self.label_name.text = model.name;
    self.label_content.text = model.lessonDescription;
    self.label_help.text = model.howTo;
}
- (void)layoutSubviews{
    [self.img_header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(15);
        make.width.height.mas_equalTo(100);
    }];
    [self.label_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.img_header.mas_right).offset(15);
        make.top.mas_equalTo(15);
        make.height.mas_equalTo(25);
    }];
    [self.label_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.img_header.mas_right).offset(15);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.label_name.mas_bottom).offset(5);
    }];
    
    [self.label_help mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.img_header.mas_right).offset(15);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-15);
        make.height.mas_equalTo(20);
    }];
    
}
#pragma mark - private
- (void)createUI{
    [self.contentView addSubview:self.img_header];
    [self.contentView addSubview:self.label_name];
    [self.contentView addSubview:self.label_content];
    [self.contentView addSubview:self.label_help];
}
#pragma mark - lazy load
-(UIImageView *)img_header{
    if(!_img_header){
        _img_header =[[UIImageView alloc]init];
//        _img_header.image = [UIImage imageNamed:@"Tmp_home_appListCellHead"];
    }
    return _img_header;
}
- (UILabel *)label_name{
    if(!_label_name){
        _label_name = [[UILabel alloc]init];
        _label_name.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
        _label_name.textColor = [UIColor colorWithHex:0x111111];
        _label_name.text = @"淘宝";
    }
    return _label_name;
}
- (UILabel *)label_content{
    if(!_label_content){
        _label_content = [[UILabel alloc]init];
        _label_content.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _label_content.textColor = [UIColor colorWithHex:0x111111];
        _label_content.numberOfLines = 3;
        _label_content.text = @"The Great Wall of China is a series of fortifications made of stone, brick, tamped earth, wood.";
    }
    return _label_content;
}
- (UILabel *)label_help{
    if(!_label_help){
        _label_help = [[UILabel alloc]init];
        _label_help.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _label_help.textColor = [UIColor colorWithHex:0x555555];
        _label_help.text = @" How to use Taobao? ";
        _label_help.backgroundColor = [UIColor colorWithHex:0xE2E5ED];
        _label_help.layer.cornerRadius = 4;
        _label_help.layer.masksToBounds = YES;
    }
    return _label_help;
}
@end
