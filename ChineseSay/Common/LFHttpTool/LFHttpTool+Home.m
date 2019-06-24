//
//  LFHttpTool+Home.m
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/18.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "LFHttpTool+Home.h"

@implementation LFHttpTool (Home)
+ (void)home_getDataForHomePageSuccess:(LFRequestSuccessBlock)success
                               failure:(LFRequestFailureBlock)failure{
    [LFHttpTool getData:[NSString stringWithFormat:@"%@/api/home/index",BaseUrl] parameters:nil success:^(id responseObject) {
        success(responseObject);
    } faliure:^(NSError *error) {
        failure(error);
    }];
}
+ (void)home_getDataForCultureDetailListParams:(NSDictionary *)params Success:(LFRequestSuccessBlock)success failure:(LFRequestFailureBlock)failure{
    [LFHttpTool getData:[NSString stringWithFormat:@"%@/api/home/detail",BaseUrl] parameters:params success:^(id responseObject) {
        success(responseObject);
    } faliure:^(NSError *error) {
        failure(error);
    }];
}
@end
