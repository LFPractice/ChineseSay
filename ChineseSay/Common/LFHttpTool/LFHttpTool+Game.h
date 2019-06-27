//
//  LFHttpTool+Game.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/27.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "LFHttpTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface LFHttpTool (Game)

/**
 * 请求题目列表数据
 */
+ (void)game_getDataForQuestionListParam:(NSDictionary *)params
                               Success:(LFRequestSuccessBlock)success
                               Failure:(LFRequestFailureBlock)failure;
@end

NS_ASSUME_NONNULL_END
