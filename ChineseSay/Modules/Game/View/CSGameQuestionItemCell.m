//
//  CSGameQuestionItemCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/27.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSGameQuestionItemCell.h"
@interface CSGameQuestionItemCell()
@property (nonatomic, strong) UIView *view_bg;
@property (nonatomic, strong) UILabel *label_content;
@property (nonatomic, strong) UIImageView *img_mark;
@property (nonatomic, strong) CSGameQuestionItemModel *model;
@end
@implementation CSGameQuestionItemCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)layoutSubviews{
    [self.view_bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.right.mas_equalTo(-10);
        make.left.mas_equalTo(10);
    }];
    [self.label_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    [self.img_mark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(50);
    }];
}
- (void)createUI{
    [self.contentView addSubview:self.view_bg];
    [self.view_bg addSubview:self.label_content];
    [self.view_bg addSubview:self.img_mark];
}
#pragma mark - lazy load
- (UIView *)view_bg{
    if(!_view_bg){
        _view_bg = [[UIView alloc]init];
    }
    return _view_bg;
}
- (UILabel *)label_content{
    if(!_label_content){
        _label_content = [[UILabel alloc]init];
        _label_content.font = [UIFont systemFontOfSize:14];
        _label_content.textColor = [UIColor colorWithHex:0x333333];
        _label_content.text = @"A.china";
    }
    return _label_content;
}
- (UIImageView *)img_mark{
    if(!_img_mark){
        _img_mark = [[UIImageView alloc]init];
        _img_mark.image = [UIImage imageNamed:@"game_question_right"];
    }
    return _img_mark;
}

- (void)loadData:(CSGameQuestionItemModel *)model IndexPath:(NSIndexPath *)indexPath{
    self.model = model;
    self.label_content.text = [NSString stringWithFormat:@"%@.%@",model.option,model.content];
    if(model.isCorrect){
        self.img_mark.image = [UIImage imageNamed:@"game_question_right"];
    }else{
        self.img_mark.image = [UIImage imageNamed:@"game_question_wrong"];
    }
    if(self.questionModel.isShowAnwser){
        if(model.isSelect || model.isCorrect){
            self.img_mark.hidden = NO;
        }
    }else{
        self.img_mark.hidden = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    self.model.isSelect = selected;
    if(selected){
        self.view_bg.backgroundColor = [UIColor greenColor];
    }else{
        self.view_bg.layer.cornerRadius = 10;
        self.view_bg.layer.borderWidth = 1;
        self.view_bg.layer.borderColor = [UIColor colorWithHex:0x333333].CGColor;
        self.view_bg.backgroundColor = [UIColor whiteColor];
    }
}

@end
