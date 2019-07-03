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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
