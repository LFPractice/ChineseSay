//
//  CSMineItemCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/15.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineItemCell.h"
#import "CSMineItemModel.h"
@interface CSMineItemCell()
@property (nonatomic, strong) UILabel *label_title;
@property (nonatomic, strong) UILabel *label_count;
@property (nonatomic, strong) UIImageView *img_mark;
@property (nonatomic, strong) UIView *view_bottomLine;
@end
@implementation CSMineItemCell
#pragma mark - assist method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    CSMineItemModel *itemModel = model;
    self.label_title.text = itemModel.title;
    if([itemModel.count isEqualToString:@"0"] || itemModel.count.length == 0){
        self.label_count.hidden = YES;
    }else{
        self.label_count.text = itemModel.count;
    }
}
- (void)layoutSubviews{
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
    }];
    [self.img_mark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(12);
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(0);
    }];
    [self.label_count mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.img_mark.mas_left).offset(-5);
        make.width.height.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
    }];
    [self.view_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5 );
    }];
}
#pragma mark - private
- (void)createUI{
    [self.contentView addSubview:self.label_title];
    [self.contentView addSubview:self.label_count];
    [self.contentView addSubview:self.img_mark];
    [self.contentView addSubview:self.view_bottomLine];
}

#pragma lazy load
- (UILabel *)label_title{
    if(!_label_title){
        _label_title = [[UILabel alloc]init];
        _label_title.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _label_title.textColor = [UIColor colorWithHex:0x333333];
        _label_title.text = @"新消息";
    }
    return _label_title;
}
- (UILabel *)label_count{
    if(!_label_count){
        _label_count = [[UILabel alloc]init];
        _label_count.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _label_count.textColor = [UIColor colorWithHex:0xffffff];
        _label_count.textAlignment = NSTextAlignmentCenter;
        _label_count.text = @"99";
        _label_count.backgroundColor = [UIColor colorWithHex:0xF86464];
        _label_count.layer.cornerRadius = 10;
        _label_count.layer.masksToBounds = YES;
    }
    return _label_count;
}
- (UIImageView *)img_mark{
    if(!_img_mark){
        _img_mark = [[UIImageView alloc]init];
        _img_mark.image = [UIImage imageNamed:@"mine_item_nextMark"];
    }
    return _img_mark;
}
- (UIView *)view_bottomLine{
    if(!_view_bottomLine){
        _view_bottomLine = [[UIView alloc]init];
        _view_bottomLine.backgroundColor = [UIColor colorWithHex:0xa8a8a8];
    }
    return _view_bottomLine;
}
@end
