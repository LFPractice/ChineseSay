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
+ (void)mine_registWithParam:(NSDictionary *)params Success:(LFRequestSuccessBlock)success Failure:(LFRequestFailureBlock)failure{
    [LFHttpTool postData:[NSString stringWithFormat:@"%@/api/signUpWithAccount",BaseUrl] parameters:params success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
+ (void)mine_getuserInfoWithParam:(NSDictionary *)params
                          Success:(LFRequestSuccessBlock)success
                          Failure:(LFRequestFailureBlock)failure{
    [LFHttpTool getData:[NSString stringWithFormat:@"%@/api/info",BaseUrl] parameters:params success:^(id responseObject) {
        success(responseObject);
    } faliure:^(NSError *error) {
        failure(error);
    }];
}
+ (void)mine_updateUserInfoWithParam:(NSDictionary *)params
                             Success:(LFRequestSuccessBlock)success
                             Failure:(LFRequestFailureBlock)failure {
    [LFHttpTool postData:[NSString stringWithFormat:@"%@/api/update",BaseUrl] parameters:params success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
+ (void)mine_updateUserAvatarWithImageData:(NSData *)imageData
                                   Success:(LFRequestSuccessBlock)success
                                   Failure:(LFRequestFailureBlock)failure{

    [LFHttpTool postDataWithUrl:[NSString stringWithFormat:@"%@/api/file/upload",BaseUrl] constructingBody:^(id<AFMultipartFormData> formdata) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSString *str = [formatter stringFromDate:[NSDate date]];
        formatter.dateFormat =@"yyyyMMddHHmmss";
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];;
        
        [formdata appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpeg"];
    } param:@{} progress:^(NSProgress * progress) {
        
    } success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}
+ (void)mine_getuserShopInfoWithParam:(NSDictionary *)params Success:(LFRequestSuccessBlock)success Failure:(LFRequestFailureBlock)failure {
    
    [LFHttpTool getData:[NSString stringWithFormat:@"%@/api/shop/list",BaseUrl] parameters:params success:^(id responseObject) {
        success(responseObject);
    } faliure:^(NSError *error) {
        failure(error);
    }];
}
+ (void)mine_designChinesesNameWithParam:(NSDictionary *)params
                                 Success:(LFRequestSuccessBlock)success
                                 Failure:(LFRequestFailureBlock)failure {
    [LFHttpTool postData:[NSString stringWithFormat:@"%@/api/getChineseName",BaseUrl] parameters:params success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
+ (void)mine_chineseGiftWithParam:(NSDictionary *)params
                          Success:(LFRequestSuccessBlock)success
                          Failure:(LFRequestFailureBlock)failure {
    [LFHttpTool postData:[NSString stringWithFormat:@"%@/api/getGift",BaseUrl] parameters:params success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
+ (void)mine_getShopTaskWithParam:(NSDictionary *)params
                          Success:(LFRequestSuccessBlock)success
                          Failure:(LFRequestFailureBlock)failure {
    [LFHttpTool getData:[NSString stringWithFormat:@"%@/api/task/list",BaseUrl] parameters:params success:^(id responseObject) {
        success(responseObject);
    } faliure:^(NSError *error) {
        failure(error);
    }];
}
@end
