//
//  LFHttpTool+Mine.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/30.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "LFHttpTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface LFHttpTool (Mine)

/**
 * 登录
 */
+ (void)mine_loginWithParam:(NSDictionary *)params
                                 Success:(LFRequestSuccessBlock)success
                                 Failure:(LFRequestFailureBlock)failure;
/**
 * 注册
 */
+ (void)mine_registWithParam:(NSDictionary *)params
                    Success:(LFRequestSuccessBlock)success
                    Failure:(LFRequestFailureBlock)failure;
/**
 * 获取用户信息
 */
+ (void)mine_getuserInfoWithParam:(NSDictionary *)params
                     Success:(LFRequestSuccessBlock)success
                     Failure:(LFRequestFailureBlock)failure;
@end

NS_ASSUME_NONNULL_END
