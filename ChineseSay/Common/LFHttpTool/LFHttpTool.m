//
//  LFHttpTool.m
//  Network_Tool
//
//  Created by 王林芳 on 2018/3/28.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import "LFHttpTool.h"

@implementation LFHttpTool
+(instancetype)sharedHttpTool{
    static LFHttpTool *shareHttpTool = nil;
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        shareHttpTool = [self client];
    });
    return shareHttpTool;
}
+ (instancetype)client
{
    NSURLSessionConfiguration *configration = [NSURLSessionConfiguration defaultSessionConfiguration];
    LFHttpTool *manager = [[self alloc]initWithBaseURL:nil sessionConfiguration:configration];
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc]initWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",@"image/png", nil];
    return manager;
}
/**
 *GET
 */
+ (NSURLSessionDataTask *)getData:(NSString *)urlString
                       parameters:(id)parameters
                          success:(void (^)(id))success
                          faliure:(void (^)(NSError *))failure{
    
    return [self requestWithMethood:LFRequsetMethodTypeGET urlString:urlString parameters:parameters success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
/**
 *POST
 */
+ (NSURLSessionDataTask *)postData:(NSString *)urlString
                        parameters:(id)parameters
                           success:(void (^)(id))success
                           failure:(void (^)(NSError *))failure{
        return [self requestWithMethood:LFRequsetMethodTypePOST urlString:urlString parameters:parameters success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+ (NSURLSessionDataTask *)requestWithMethood:(LFRequsetMethodType) methodType
                                   urlString:(NSString *)urlString
                                  parameters:(NSDictionary *)parameters
                                     success:(void (^)(id responseObject)) success
                                     failure:(void (^)(NSError *error ))failure{
    LFHttpTool *manager = [self sharedHttpTool];
    
    if(methodType == LFRequsetMethodTypeGET){
        return [manager GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
    if(methodType == LFRequsetMethodTypePOST){
        return  [manager POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
    NSURLSessionDataTask *task = [[NSURLSessionDataTask alloc]init];
    return task;
}
@end
























