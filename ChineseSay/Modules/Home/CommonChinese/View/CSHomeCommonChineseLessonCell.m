//
//  CSHomeCommonChineseLessonCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/25.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeCommonChineseLessonCell.h"
@interface CSHomeCommonChineseLessonCell()
@property (nonatomic, strong) UIImageView *imgCenterLine;
@end
@implementation CSHomeCommonChineseLessonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createUI];
    }
    return self;
}
- (void)layoutSubviews{
    [self.imgCenterLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(16);
        make.top.bottom.mas_equalTo(0);
    }];
}
- (void)createUI{
    [self.contentView addSubview:self.imgCenterLine];
}
-(UIImageView *)imgCenterLine{
    if(!_imgCenterLine){
        _imgCenterLine = [[UIImageView alloc]init];
        _imgCenterLine.image = [UIImage imageNamed:@"home_lesson_cell_centerLine"];
    }
    return _imgCenterLine;
}
@end
