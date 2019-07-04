//
//  CSMineHeaderItemView.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/16.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineHeaderItemView.h"
@interface CSMineHeaderItemView()
@property (nonatomic, strong) UIImageView *img_nextMark;

@end
@implementation CSMineHeaderItemView
#pragma mark - assist method
- (instancetype)init{
    self = [super init];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(self.itemBlock) {
        self.itemBlock(self.tag);
    }
}
- (void)layoutSubviews{
//    CGFloat scale = kScreenWidth / 375.0;
    [self.label_count mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
    }];
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label_count.mas_bottom).offset(3);
        make.centerX.mas_equalTo(0);
    }];
    [self.label_des mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.label_title.mas_bottom).offset(0);
    }];
    [self.img_nextMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.label_title.mas_right).offset(7);
        make.width.height.mas_equalTo(8);
        make.centerY.mas_equalTo(self.label_title.mas_centerY).offset(0);
    }];
    [self.view_verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(40);
        make.centerY.mas_equalTo(0);
    }];
}
#pragma mark - private
- (void)createUI{
    [self addSubview:self.label_count];
    [self addSubview:self.label_title];
    [self addSubview:self.label_des];
    [self addSubview:self.img_nextMark];
    [self addSubview:self.view_verticalLine];
}
#pragma mark - lazy load
- (UILabel *)label_count{
    if(!_label_count){
        _label_count = [[UILabel alloc]init];
        _label_count.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:20];
        _label_count.textColor = [UIColor colorWithHex:0xFAB416];
        _label_count.textAlignment = NSTextAlignmentCenter;
        _label_count.text = @"235";
    }
    return _label_count;
}
- (UILabel *)label_title{
    if(!_label_title){
        _label_title = [[UILabel alloc]init];
        _label_title.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        _label_title.textColor = [UIColor colorWithHex:0x333333];
        _label_title.textAlignment = NSTextAlignmentCenter;
        _label_title.text = @"积分商城";
    }
    return _label_title;
}
- (UILabel *)label_des{
    if(!_label_des){
        _label_des = [[UILabel alloc]init];
        _label_des.font = [UIFont fontWithName:@"PingFangSC-Regular" size:8];
        _label_des.textColor = [UIColor colorWithHex:0x555555];
        _label_des.textAlignment = NSTextAlignmentCenter;
        _label_des.text = @"立即签到领积分";
    }
    return _label_des;
}
- (UIImageView *)img_nextMark{
    if(!_img_nextMark){
        _img_nextMark = [[UIImageView alloc]init];
        _img_nextMark.image = [UIImage imageNamed:@"mine_header_item_nextMark"];
    }
    return _img_nextMark;
}
- (UIView *)view_verticalLine{
    if(!_view_verticalLine){
        _view_verticalLine = [[UIView alloc]init];
        _view_verticalLine.backgroundColor = [UIColor colorWithHex:0xB7BED1];
    }
    return _view_verticalLine;
}
- (NSInteger)width{
    if(_width == 0){
        _width = kScreenWidth / 3.0;
    }
    return _width;
}
- (NSInteger)height{
    if(_height == 0){
        _height = 70;
    }
    return _height;
}
@end
