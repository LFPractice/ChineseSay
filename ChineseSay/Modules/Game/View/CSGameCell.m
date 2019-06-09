//
//  CSGameCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/9.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSGameCell.h"
#import "CSGameModel.h"
@interface CSGameCell()
@property (nonatomic, strong)UIView *view_bg;
@property (nonatomic, strong)UILabel *label_title;
@end
@implementation CSGameCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)layoutSubviews{
    [self.view_bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
    }];

    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(0);
    }];
}

-(void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    CSGameModel *itemModel = (CSGameModel *)model;
    self.view_bg.backgroundColor = [UIColor colorWithHex:itemModel.bgColor];
    self.label_title.text = itemModel.title;
}
- (void)createUI{
    [self.contentView addSubview:self.view_bg];
}
#pragma mark - lazy load
- (UIView *)view_bg{
    if(!_view_bg){
        _view_bg = [[UIView alloc]init];
        _view_bg.layer.cornerRadius = 10;
        [_view_bg addSubview:self.label_title];
    }
    return _view_bg;
}
- (UILabel *)label_title{
    if(!_label_title){
        _label_title = [[UILabel alloc]init];
        _label_title.textColor = [UIColor whiteColor];
        _label_title.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:20];
        _label_title.textAlignment = NSTextAlignmentCenter;
    }
    return _label_title;
}
@end
