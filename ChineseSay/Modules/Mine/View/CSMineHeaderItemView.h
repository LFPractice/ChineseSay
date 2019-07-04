//
//  CSMineHeaderItemView.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/16.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSMineHeaderItemView : CSBaseView
@property (nonatomic, copy) void(^itemBlock)(NSInteger tag);
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) UILabel *label_count;
@property (nonatomic, strong) UILabel *label_title;
@property (nonatomic, strong) UILabel *label_des;
@property (nonatomic, strong) UIView *view_verticalLine;
@end

NS_ASSUME_NONNULL_END
