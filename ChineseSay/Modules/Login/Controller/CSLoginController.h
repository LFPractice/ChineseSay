//
//  CSLoginController.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/30.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "CSBaseController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSLoginController : CSBaseController
@property (nonatomic, copy) void(^loginSuccess)();
@end

NS_ASSUME_NONNULL_END
