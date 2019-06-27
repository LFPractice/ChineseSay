//
//  LFHttpTool+Game.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/27.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "LFHttpTool+Game.h"

@implementation LFHttpTool (Game)
+ (void)game_getDataForQuestionListParam:(NSDictionary *)params Success:(LFRequestSuccessBlock)success Failure:(LFRequestFailureBlock)failure{
    [LFHttpTool getData:[NSString stringWithFormat:@"%@/api/question",BaseUrl] parameters:params success:^(id responseObject) {
        success(responseObject);
    } faliure:^(NSError *error) {
        failure(error);
    }];
}
@end
