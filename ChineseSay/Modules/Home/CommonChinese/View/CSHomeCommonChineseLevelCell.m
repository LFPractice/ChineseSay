//
//  CSHomeCommonChineseLevelCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/13.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeCommonChineseLevelCell.h"
@interface CSHomeCommonChineseLevelCell()
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UILabel *label_title;
@property (nonatomic, strong) UIView *view_lineVertical;
@property (nonatomic, strong) UIImageView *view_lineHorizontal;
@end
@implementation CSHomeCommonChineseLevelCell

#pragma mark - assist method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    _indexPath = path;
    self.label_title.text = [NSString stringWithFormat:@"Level %ld",path.row + 1];
    [self layoutIfNeeded];
}
- (void)layoutSubviews{
    if (self.indexPath.row % 2 == 0) {
        // 偶数行
        [self.label_title mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
            make.right.mas_equalTo(self.mas_centerX).offset(-17);
            make.height.mas_equalTo(60);
            make.top.mas_equalTo(0);
        }];
        [self.view_lineHorizontal mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
            make.right.mas_equalTo(self.mas_centerX).offset(0);
            make.height.mas_equalTo(1);
            make.bottom.mas_equalTo(0);
        }];
        self.view_lineHorizontal.image = [UIImage imageNamed:@"home_commonChineseLevel_left"];
    }else{
        [self.label_title mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-30);
            make.left.mas_equalTo(self.mas_centerX).offset(17);
            make.height.mas_equalTo(60);
            make.top.mas_equalTo(0);
        }];
        [self.view_lineHorizontal mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-30);
            make.left.mas_equalTo(self.mas_centerX).offset(0);
            make.height.mas_equalTo(1);
            make.bottom.mas_equalTo(0);
        }];
        self.view_lineHorizontal.image = [UIImage imageNamed:@"home_commonChineseLevel_right"];
    }
    [self.view_lineVertical mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(1);
    }];
}
#pragma mark - private
- (void)createUI{
    [self.contentView addSubview:self.label_title];
    [self.contentView addSubview:self.view_lineVertical];
    [self.contentView addSubview:self.view_lineHorizontal];
}
#pragma mark - lazy load
- (UILabel *)label_title{
    if(!_label_title){
        _label_title = [[UILabel alloc]init];
        _label_title.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
        _label_title.textColor =[UIColor whiteColor];
        _label_title.text = @"Level 1";
        _label_title.textAlignment = NSTextAlignmentCenter;
        _label_title.backgroundColor = [UIColor colorWithHex:0xF77F7C];
        _label_title.layer.cornerRadius = 8;
        _label_title.layer.masksToBounds = YES;
    }
    return _label_title;
}
- (UIView *)view_lineVertical{
    if(!_view_lineVertical){
        _view_lineVertical = [[UIView alloc]init];
        _view_lineVertical.backgroundColor = [UIColor colorWithHex:0xB7BED1];
    }
    return _view_lineVertical;
}
- (UIImageView *)view_lineHorizontal{
    if(!_view_lineHorizontal){
        _view_lineHorizontal = [[UIImageView alloc]init];
//        _view_lineHorizontal.backgroundColor = [UIColor colorWithHex:0xB7BED1];
    }
    return _view_lineHorizontal;
}

@end
