//
//  CSHomeEssayItemCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/3.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeEssayItemCell.h"

@implementation CSHomeEssayItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
//    self.contentView.layer.cornerRadius = 10;
//    UIRectCorner corner = UIRectCornerAllCorners;
//    self.layer.cornerRadius = 10;
//    [self cs_radiusWithRadius:10 corner:corner];
//    self.layer.masksToBounds = YES;
//    self.contentView.layer.masksToBounds = YES;
}
- (void)setModel:(CSHomeEssayListModel *)model {
    _model = model;
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    self.label_content.text = model.title;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
