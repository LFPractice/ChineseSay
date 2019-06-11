//
//  CSHomeChinesePlaceDetailCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/11.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeChinesePlaceDetailCell.h"

@implementation CSHomeChinesePlaceDetailCell
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createUI];
    }
    return self;
}
- (void)createUI{
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 10;
    self.contentView.backgroundColor = [UIColor whiteColor];
}
@end
