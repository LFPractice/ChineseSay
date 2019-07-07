//
//  CSMineGetJiFenCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/5.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSMineGetJiFenCell.h"
@interface CSMineGetJiFenCell()
@property (weak, nonatomic) IBOutlet UIImageView *markImg;
@property (weak, nonatomic) IBOutlet UILabel *readyToGetLabel;
@property (weak, nonatomic) IBOutlet UILabel *alreadyGetLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation CSMineGetJiFenCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (void)setModel:(CSMineGetJiFenModel *)model {
    _model = model;
    self.titleLabel.text = model.taskName;
    if(model.taskState.integerValue == 0 ) {
        self.markImg.hidden = YES;
        self.readyToGetLabel.hidden = NO;
        self.alreadyGetLabel.hidden = YES;
    }else {
        self.markImg.hidden = NO;
        self.readyToGetLabel.hidden = YES;
        self.alreadyGetLabel.hidden = NO;
    }
    
    self.readyToGetLabel.text = [NSString stringWithFormat:@"+%@",model.taskScore];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
