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
/**
 * 更新用户信息
 */
+ (void)mine_updateUserInfoWithParam:(NSDictionary *)params
                          Success:(LFRequestSuccessBlock)success
                          Failure:(LFRequestFailureBlock)failure;
/**
 * 更新用户头像
 */
+ (void)mine_updateUserAvatarWithImageData:(NSData *)imageData
                                   Success:(LFRequestSuccessBlock)success
                             Failure:(LFRequestFailureBlock)failure;
/**
 * 获取用户积分商城相关信息
 */
+ (void)mine_getuserShopInfoWithParam:(NSDictionary *)params
                          Success:(LFRequestSuccessBlock)success
                          Failure:(LFRequestFailureBlock)failure;
/**
 * 定制中文名字
 */
+ (void)mine_designChinesesNameWithParam:(NSDictionary *)params
                             Success:(LFRequestSuccessBlock)success
                             Failure:(LFRequestFailureBlock)failure;

/**
 * 领取小礼物
 */
+ (void)mine_chineseGiftWithParam:(NSDictionary *)params
                                 Success:(LFRequestSuccessBlock)success
                                 Failure:(LFRequestFailureBlock)failure;
@end

NS_ASSUME_NONNULL_END
