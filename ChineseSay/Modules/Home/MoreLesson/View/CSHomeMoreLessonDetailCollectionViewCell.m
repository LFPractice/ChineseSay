//
//  CSHomeMoreLessonDetailCollectionViewCell.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/6.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSHomeMoreLessonDetailCollectionViewCell.h"

@implementation CSHomeMoreLessonDetailCollectionViewCell

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
