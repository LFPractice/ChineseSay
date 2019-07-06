//
//  CSMineJiFenShopItemView.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/7/4.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseView.h"
#import "CSMineJiFenShopItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CSMineJiFenShopItemView : CSBaseView
@property (nonatomic, strong) CSMineJiFenShopItemModel *model;
@property (nonatomic, copy) void(^actionBlock)(NSInteger index);
@end

NS_ASSUME_NONNULL_END
