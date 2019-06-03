//
//  CSItemSigleCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSItemSigleCell.h"
#import "CSHomeItemSingleCellModel.h"
@interface CSItemSigleCell()
@property (nonatomic, strong) UIImageView *img_bg;
@property (nonatomic, strong) UIImageView *img_mark;
@property (nonatomic, strong) UILabel *label_title;
@end
@implementation CSItemSigleCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)createUI{
    [self.contentView addSubview:self.img_bg];
    [self.contentView addSubview:self.img_mark];
    [self.contentView addSubview:self.label_title];
}
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    CSHomeItemSingleCellModel *itemModel = (CSHomeItemSingleCellModel *)model;
    [self.img_bg setBackgroundColor:[UIColor colorWithHex:itemModel.bgColor]];
    self.img_mark.image = [UIImage imageNamed:itemModel.imgName];
    self.label_title.text = itemModel.title;
}

- (void)layoutSubviews{
    [self.img_bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.bottom.mas_equalTo(-10);
    }];
    
    [self.img_mark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(-80);
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(34);
    }];
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.img_mark.mas_right).offset(20);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
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
        _label_title.font = [UIFont boldSystemFontOfSize:18];
        _label_title.textColor = [UIColor whiteColor];
    }
    return _label_title;
}
@end
