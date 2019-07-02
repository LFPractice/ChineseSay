//
//  CSMineDetailController.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/15.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseController.h"
#import "CSUserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSMineDetailController : CSBaseController
- (void)loadData;
@property (nonatomic, copy) void(^turnToUserInfoDetail)();
@property (nonatomic, strong) CSUserInfoModel *userInfoModel;
@end

NS_ASSUME_NONNULL_END
