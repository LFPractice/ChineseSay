//
//  CSMineGetJiFenHeader.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/5.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineGetJiFenHeader.h"
@interface CSMineGetJiFenHeader ()
@property (nonatomic, strong) UIImageView *bgImg;

@property (nonatomic, strong) UIImageView *actionImg;
@end
@implementation CSMineGetJiFenHeader
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self createUI];
    }
    return self;
}
- (void)actionClick {
    if(self.actionBlock && self.isShowAction){
        self.actionBlock(0);
    }
}
- (void)setIsShowAction:(BOOL)isShowAction {
    _isShowAction = isShowAction;
    if(isShowAction) {
        self.actionLabel.hidden = NO;
        self.actionImg.hidden = NO;
    }else {
        self.actionLabel.hidden = YES;
        self.actionImg.hidden = YES;
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.centerX.mas_equalTo(0);
    }];
    [self.jiFenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(15);
        make.centerX.mas_equalTo(0);
    }];
    [self.actionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.jiFenLabel.mas_bottom).offset(17);
        make.centerX.mas_equalTo(0);
    }];
    [self.actionImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.actionLabel.mas_right).offset(8);
        make.centerY.mas_equalTo(self.actionLabel.mas_centerY).offset(0);
        make.size.mas_equalTo(CGSizeMake(11, 11));
    }];
}
- (void)createUI {
    [self addSubview:self.bgImg];
    [self addSubview:self.titleLabel];
    [self addSubview:self.jiFenLabel];
    [self addSubview:self.actionLabel];
    [self addSubview:self.actionImg];
}
- (UIImageView *)bgImg {
    if(!_bgImg) {
        _bgImg = [[UIImageView alloc]init];
        _bgImg.image = [UIImage imageNamed:@"mine_headerBg"];
    }
    return _bgImg;
}
- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textColor =[UIColor colorWithHex:0xffffff];
        _titleLabel.text = @"积分商城";
    }
    return _titleLabel;
}
- (UILabel *)jiFenLabel {
    if(!_jiFenLabel) {
        _jiFenLabel = [[UILabel alloc]init];
        _jiFenLabel.font = [UIFont boldSystemFontOfSize:40];
        _jiFenLabel.textColor =[UIColor colorWithHex:0xffffff];
        _jiFenLabel.text = @"235";
    }
    return _jiFenLabel;
}
- (UILabel *)actionLabel {
    if(!_actionLabel) {
        _actionLabel = [[UILabel alloc]init];
        _actionLabel.font = [UIFont boldSystemFontOfSize:15];
        _actionLabel.textColor =[UIColor colorWithHex:0xffffff];
        _actionLabel.text = @"领取记录";
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionClick)];
        [_actionLabel addGestureRecognizer:tap];
        _actionLabel.userInteractionEnabled = YES;
    }
    return _actionLabel;
}
- (UIImageView *)actionImg {
    if(!_actionImg) {
        _actionImg = [[UIImageView alloc]init];
        _actionImg.image = [UIImage imageNamed:@"mine_header_infoNextMark"];
    }
    return _actionImg;
}
@end
