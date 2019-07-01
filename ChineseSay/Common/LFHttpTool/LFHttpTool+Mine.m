//
//  LFHttpTool+Mine.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/30.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "LFHttpTool+Mine.h"

@implementation LFHttpTool (Mine)
+ (void)mine_loginWithParam:(NSDictionary *)params
                    Success:(LFRequestSuccessBlock)success
                    Failure:(LFRequestFailureBlock)failure{
    [LFHttpTool postData:[NSString stringWithFormat:@"%@/api/loginWithAccount",BaseUrl] parameters:params success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
