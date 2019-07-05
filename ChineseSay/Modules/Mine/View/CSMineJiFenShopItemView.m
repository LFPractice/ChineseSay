//
//  CSMineJiFenShopItemView.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/4.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineJiFenShopItemView.h"
@interface CSMineJiFenShopItemView()
@property (strong, nonatomic)  UILabel *titleLabel;
@property (strong, nonatomic)  UIButton *getButton;
@property (strong, nonatomic)  UILabel *jiFenLabel;
@end
@implementation CSMineJiFenShopItemView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)setModel:(CSMineJiFenShopItemModel *)model {
    _model = model;
    self.titleLabel.text = model.titleName;
    self.jiFenLabel.text = [NSString stringWithFormat:@"满%@积分",model.jiFen];
}
- (void)createUI {
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    self.jiFenLabel.layer.cornerRadius = 8.5;
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.getButton];
    [self addSubview:self.jiFenLabel];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(25);
        make.centerX.mas_equalTo(0);
    }];
    [self.getButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
    }];
    [self.jiFenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.getButton.mas_bottom).offset(10);
        make.height.mas_equalTo(17);
        make.width.mas_equalTo(80);
        make.centerX.mas_equalTo(0);
    }];
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor colorWithHex:0x555555];
        _titleLabel.text = @"一天免费会员体验";
    }
    return _titleLabel;
}
- (UIButton *)getButton {
    if(!_getButton) {
        _getButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_getButton setTitle:@"点击领取" forState:UIControlStateNormal];
        _getButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [_getButton setTitleColor:[UIColor colorWithHex:0xFAB416] forState:UIControlStateNormal];
    }
    return _getButton;
}
- (UILabel *)jiFenLabel {
    if(!_jiFenLabel) {
        _jiFenLabel = [[UILabel alloc]init];
        _jiFenLabel.font = [UIFont systemFontOfSize:10];
        _jiFenLabel.textColor = [UIColor colorWithHex:0xffffff];
        _jiFenLabel.backgroundColor = [UIColor colorWithHex:0xF8B00D];
        _jiFenLabel.layer.cornerRadius = 8.5;
        _jiFenLabel.layer.masksToBounds = YES;
        _jiFenLabel.textAlignment = NSTextAlignmentCenter;
        _jiFenLabel.text = @"满200积分";
    }
    return _jiFenLabel;
}
@end
