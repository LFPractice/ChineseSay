//
//  CSHomeTitleCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/2.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeTitleCell.h"
#import "CSHomeTitleCellModel.h"
@interface CSHomeTitleCell()
@property (nonatomic, strong) UILabel *label_leftTitle;
@property (nonatomic, strong) UIButton *btn_rightTitle;
@property (nonatomic, strong) UIImageView *img_rightMark;
@property (nonatomic, strong) CSHomeTitleCellModel *model;
@end
@implementation CSHomeTitleCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    CSHomeTitleCellModel *cellModel = (CSHomeTitleCellModel *)model;
    self.model = cellModel;
    self.label_leftTitle.text = cellModel.leftTitle;
    if(cellModel.rightTitle.length){
        [self.btn_rightTitle setTitle:cellModel.rightTitle forState:UIControlStateNormal];
        self.btn_rightTitle.hidden = NO;
        self.img_rightMark.hidden = NO;
    }else{
        self.btn_rightTitle.hidden = YES;
        self.img_rightMark.hidden = YES;
    }
}
- (void)createUI{
    [self.contentView addSubview:self.label_leftTitle];
    [self.contentView addSubview:self.btn_rightTitle];
    [self.contentView addSubview:self.img_rightMark];
}
- (void)layoutSubviews{
    [self.label_leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.btn_rightTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-27);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(17);
        make.width.mas_equalTo(60);
    }];
    
    [self.img_rightMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(12);
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(self.btn_rightTitle.mas_centerY).offset(0);
    }];
}
- (void)btnClick{
    [[CSPageTransfer shareInstance]dispatchTransFerActionWithPageModel:self.model.pageModel];
}
#pragma mark--lazy
- (UILabel *)label_leftTitle{
    if(!_label_leftTitle){
        _label_leftTitle = [[UILabel alloc]init];
        _label_leftTitle.font = [UIFont boldSystemFontOfSize:18];
        _label_leftTitle.textColor =[UIColor colorWithHex:0x333333];
    }
    return _label_leftTitle;
}
- (UIButton *)btn_rightTitle{
    if(!_btn_rightTitle){
        _btn_rightTitle = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn_rightTitle.titleLabel.font = [UIFont systemFontOfSize:12];
        _btn_rightTitle.titleLabel.textAlignment = NSTextAlignmentRight;
        [_btn_rightTitle addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [_btn_rightTitle setTitleColor:[UIColor colorWithHex:0x555555] forState:UIControlStateNormal];
    }
    return _btn_rightTitle;
}
- (UIImageView *)img_rightMark{
    if(!_img_rightMark){
        _img_rightMark =[[UIImageView alloc]init];
        _img_rightMark.image = [UIImage imageNamed:@"home_rightSeeMore"];
    }
    return _img_rightMark;
}
@end
