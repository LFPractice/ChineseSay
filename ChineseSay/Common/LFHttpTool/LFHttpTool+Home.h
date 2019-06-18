//
//  LFHttpTool+Home.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/18.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "LFHttpTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface LFHttpTool (Home)
/**
 *请求首页数据
 */
+ (void)home_getDataForHomePageSuccess:(LFRequestSuccessBlock)success failure:(LFRequestFailureBlock)failure;
@end

NS_ASSUME_NONNULL_END
