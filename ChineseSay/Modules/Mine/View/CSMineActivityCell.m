//
//  CSMineActivityCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/15.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineActivityCell.h"
#import "CSMineItemModel.h"
@interface CSMineActivityCell()
@property (nonatomic, strong) UIImageView *img_bg;
@end
@implementation CSMineActivityCell
#pragma mark - assist method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)loadCellWithData:(id)model cellPath:(NSIndexPath *)path{
    CSMineActivityModel *itemModel = model;
    [self.img_bg sd_setImageWithURL:[NSURL URLWithString:itemModel.imageUrl]];
}
- (void)layoutSubviews{
    [self.img_bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.right.bottom.mas_equalTo(0);
    }];
}
#pragma mark - private
- (void)createUI{
    [self.contentView addSubview:self.img_bg];
}

#pragma mark - lazy load
- (UIImageView *)img_bg{
    if(!_img_bg){
        _img_bg = [[UIImageView alloc]init];
        _img_bg.image = [UIImage imageNamed:@"mine_temActivity"];
    }
    return _img_bg;
}

@end
