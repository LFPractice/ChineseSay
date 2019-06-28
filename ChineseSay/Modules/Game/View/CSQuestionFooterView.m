//
//  CSQuestionFooterView.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/28.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSQuestionFooterView.h"
@interface CSQuestionFooterView()
@property (nonatomic, strong) UIButton *btn_submit;
@end
@implementation CSQuestionFooterView

#pragma mark - target-action
- (void)btnClick:(UIButton *)button{
    if(self.questionActionBlock){
        if(button.selected){
            self.questionActionBlock(CSQuestionActionNext);
        }else{
            self.questionActionBlock(CSQuestionActionSubmit);
        }
    }
    button.selected = YES;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)layoutSubviews{
    [self.btn_submit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(36);
        make.centerX.centerY.mas_equalTo(0);
    }];
}
- (void)createUI{
    [self addSubview:self.btn_submit];
}

- (UIButton *)btn_submit{
    if(!_btn_submit){
        _btn_submit = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn_submit setTitle:@"Submit" forState:UIControlStateNormal];
        [_btn_submit setTitle:@"Next" forState:UIControlStateSelected];
        [_btn_submit setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0x76D653]] forState:UIControlStateNormal];
        [_btn_submit setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0x6C80A8]] forState:UIControlStateSelected];
        [_btn_submit addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _btn_submit.layer.cornerRadius = 5;
        _btn_submit.layer.masksToBounds = YES;
    }
    return _btn_submit;
}
@end
