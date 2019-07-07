//
//  CSMineGetJiFenHeader.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/5.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSMineGetJiFenHeader : CSBaseView
@property (nonatomic, copy) void(^actionBlock)(NSInteger tag);
@property (nonatomic, assign) BOOL isShowAction;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *jiFenLabel;
@property (nonatomic, strong) UILabel *actionLabel;
@end

NS_ASSUME_NONNULL_END
