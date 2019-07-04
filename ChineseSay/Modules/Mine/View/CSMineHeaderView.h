//
//  CSMineHeaderView.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/15.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseView.h"
#import "CSUserInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CSMineHeaderView : CSBaseView
@property (nonatomic, copy) void(^selectItemBlock)(NSInteger tag);
@property (nonatomic, assign) BOOL isSHowVerticalLine;
@property (nonatomic, strong) CSUserInfoModel *userInfoModel;
@property (nonatomic, copy) void(^turnToUserInfoDetail)();
@end

NS_ASSUME_NONNULL_END
