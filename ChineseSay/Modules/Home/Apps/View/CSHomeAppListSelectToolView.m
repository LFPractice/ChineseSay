//
//  CSHomeAppListSelectToolView.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/9.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeAppListSelectToolView.h"

@interface CSAppListSelectBtn : UIButton

@end
@implementation CSAppListSelectBtn
+ (instancetype)buttonWithType:(UIButtonType)buttonType{
    CSAppListSelectBtn *btn = [super buttonWithType:buttonType];
    if(btn){
        [btn setTitleColor:[UIColor colorWithHex:0xFAB416] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return btn;
}
- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if(selected){
        self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:20];
    }else{
        self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:13];
    }
}
@end

@interface CSHomeAppListSelectToolView()
@property (nonatomic, strong) CSAppListSelectBtn *btn_buy; // 购买类
@property (nonatomic, strong) CSAppListSelectBtn *btn_function; // 实用类
@property (nonatomic, strong) CSAppListSelectBtn *btn_amusement; // 娱乐类
@end
@implementation CSHomeAppListSelectToolView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createUI];
    }
    return self;
}
#pragma mark - private
- (void)createUI{
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.btn_buy];
    [self addSubview:self.btn_function];
    [self addSubview:self.btn_amusement];
    self.btn_buy.selected = YES;
    self.btn_function.selected = NO;
    self.btn_amusement.selected = NO;
}
#pragma mark - lazy load
- (CSAppListSelectBtn *)btn_buy{
    if(!_btn_buy){
        _btn_buy = [CSAppListSelectBtn buttonWithType:UIButtonTypeCustom];
        _btn_buy.frame = CGRectMake(10, 0, (kScreenWidth - 10 - 10 - 10 - 10)/3, 50);
        [_btn_buy setTitle:@"购物类" forState:UIControlStateNormal];
        [_btn_buy setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xFAB416]] forState:UIControlStateNormal];
        [_btn_buy setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateSelected];
    }
    return _btn_buy;
}
- (CSAppListSelectBtn *)btn_function{
    if(!_btn_function){
        _btn_function = [CSAppListSelectBtn buttonWithType:UIButtonTypeCustom];
        _btn_function.frame = CGRectMake(10 + ((kScreenWidth - 10 - 10 - 10 - 10)/3 + 10), 0, (kScreenWidth - 10 - 10 - 10 - 10)/3, 50);
        [_btn_function setTitle:@"实用类" forState:UIControlStateNormal];
        [_btn_function setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0x3BB2BC]] forState:UIControlStateNormal];
        [_btn_function setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateSelected];
    }
    return _btn_function;
}
- (CSAppListSelectBtn *)btn_amusement{
    if(!_btn_amusement){
        _btn_amusement = [CSAppListSelectBtn buttonWithType:UIButtonTypeCustom];
        _btn_amusement.frame = CGRectMake(10 + ((kScreenWidth - 10 - 10 - 10 - 10)/3 + 10) * 2, 0, (kScreenWidth - 10 - 10 - 10 - 10)/3, 50);
        [_btn_amusement setTitle:@"娱乐类" forState:UIControlStateNormal];
        [_btn_amusement setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0x6F6FD6]] forState:UIControlStateNormal];
        [_btn_amusement setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateSelected];
    }
    return _btn_amusement;
}
@end
