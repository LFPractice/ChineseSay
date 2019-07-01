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
 * 请求首页数据
 */
+ (void)home_getDataForHomePageSuccess:(LFRequestSuccessBlock)success
                               failure:(LFRequestFailureBlock)failure;
/**
 * 请求文化详情列表数据
 */
+ (void)home_getDataForCultureDetailListParams:(NSDictionary *)params
                                       Success:(LFRequestSuccessBlock)success
                                       failure:(LFRequestFailureBlock)failure;
/**
 * 请求Level列表数据
 */
+ (void)home_getDataForLevelListParam:(NSDictionary *)params
                              Success:(LFRequestSuccessBlock)success
                              Failure:(LFRequestFailureBlock)failure;
/**
 * 请求Lesson列表数据
 */
+ (void)home_getDataForLessonListParam:(NSDictionary *)params
                              Success:(LFRequestSuccessBlock)success
                              Failure:(LFRequestFailureBlock)failure;
/**
 * 请求App列表数据
 */
+ (void)home_getDataForAppListParam:(NSDictionary *)params
                               Success:(LFRequestSuccessBlock)success
                               Failure:(LFRequestFailureBlock)failure;
@end

NS_ASSUME_NONNULL_END
