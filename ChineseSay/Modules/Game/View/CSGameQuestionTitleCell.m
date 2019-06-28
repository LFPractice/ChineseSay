//
//  CSGameQuestionTitleCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/27.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSGameQuestionTitleCell.h"
@interface CSGameQuestionTitleCell()
@property (nonatomic, strong) UILabel *label_title;
@end
@implementation CSGameQuestionTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)layoutSubviews{
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
    }];
}
- (void)loadCellWithData:(CSGameQuetionModel *)model cellPath:(NSIndexPath *)path{
    self.label_title.text = [NSString stringWithFormat:@"%@.%@",model.id,model.title];
}
- (void)createUI{
    [self.contentView addSubview:self.label_title];
}

- (UILabel *)label_title{
    if(!_label_title){
        _label_title = [[UILabel alloc]init];
        _label_title.font = [UIFont boldSystemFontOfSize:17];
        _label_title.textColor = [UIColor colorWithHex:0x333333];
    }
    return _label_title;
}
@end
