//
//  CSHomeChineseMapDetailCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/11.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeChineseMapDetailCell.h"
@interface CSHomeChineseMapDetailCell ()
@property (nonatomic, strong) UIImageView *img_big;
@property (nonatomic, strong) UIImageView *img_little;
@property (nonatomic, strong) UILabel *label_title;
@property (nonatomic, strong) CSHomeMapDetailModel *model;
@end
@implementation CSHomeChineseMapDetailCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createUI];
    }
    return self;
}
#pragma mark - assist method
- (void)loadDataWithModel:(CSHomeMapDetailModel *)model forIndex:(NSIndexPath *)indexPath{
    _model = model;
    self.img_big.image = [UIImage imageNamed:model.img_big];
    self.label_title.text = model.name;
}
- (void)layoutSubviews{
    CGFloat scale = kScreenWidth / 375.0;
    [self.img_big mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(355 * scale);
        make.height.mas_equalTo(310 * scale);
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-155 *scale);
    }];
    
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.img_big.mas_bottom).offset(-10);
    }];
    
    [self.img_little mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(120 * scale);
        make.height.mas_equalTo(105 * scale);
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-30 *scale);
    }];
}

#pragma mark - target-action
- (void)goToDetail{
    [[CSPageTransfer shareInstance]dispatchTransFerActionWithPageModel:self.model.pageModel];
}

#pragma mark - private
- (void)createUI{
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.img_big];
    [self.contentView addSubview:self.label_title];
    [self.contentView addSubview:self.img_little];
}
#pragma mark - lazy load
- (UIImageView *)img_big{
    if(!_img_big){
        _img_big = [[UIImageView alloc]init];
        _img_big.image =[UIImage imageNamed:@"home_map_huaBei"];
        _img_big.backgroundColor = [UIColor whiteColor];
        _img_big.layer.cornerRadius = 10;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToDetail)];
        [_img_big addGestureRecognizer:tap];
//        _img_big.userInteractionEnabled = YES;
    }
    return _img_big;
}
- (UIImageView *)img_little{
    if(!_img_little){
        _img_little = [[UIImageView alloc]init];
        _img_little.image =[UIImage imageNamed:@"home_map"];
        _img_little.backgroundColor = [UIColor whiteColor];
        _img_little.layer.cornerRadius = 10;
    }
    return _img_little;
}
- (UILabel *)label_title{
    if(!_label_title){
        _label_title = [[UILabel alloc]init];
        _label_title.textColor = [UIColor colorWithHex:0x333333];
        _label_title.font = [UIFont systemFontOfSize:20];
        _label_title.textAlignment = NSTextAlignmentCenter;
        _label_title.text = @"华北地区";
    }
    return _label_title;
}
@end
