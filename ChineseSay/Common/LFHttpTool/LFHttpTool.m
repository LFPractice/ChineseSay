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
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        if([CSUserInfoTool userToken].length){
            [manager.requestSerializer setValue:[CSUserInfoTool userToken] forHTTPHeaderField:@"token"];
        }
        return [manager GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
    if(methodType == LFRequsetMethodTypePOST){
        /*
        return  [manager POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
         */
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
//        NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer]requestWithMethod:@"POST" URLString:urlString parameters:nil error:nil];
        request.timeoutInterval = 30;
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"accept"];
        if([CSUserInfoTool userToken].length){
            [request setValue:[CSUserInfoTool userToken] forHTTPHeaderField:@"token"];
        }
        [request setHTTPBody:jsonData];
        
        NSURLSessionDataTask *task =  [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
            
        } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
            
        } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if(!error){
                success(responseObject);
            }else{
                failure(error);
            }
        }];
        [task resume];
        return task;
    }
    NSURLSessionDataTask *task = [[NSURLSessionDataTask alloc]init];
    return task;
}

+ (NSURLSessionDataTask *)postDataWithUrl:(NSString *)url
                         constructingBody:(void (^)(id<AFMultipartFormData>))constructBlock
                                    param:(NSDictionary *)param
                                 progress:(void (^)(NSProgress *))progress
                                  success:(LFRequestSuccessBlock)success
                                  failure:(LFRequestFailureBlock)failure {
    LFHttpTool *manager = [self sharedHttpTool];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    if([CSUserInfoTool userToken].length){
        [manager.requestSerializer setValue:[CSUserInfoTool userToken] forHTTPHeaderField:@"token"];
    }
    NSURLSessionDataTask *task = [manager POST:url parameters:param constructingBodyWithBlock:constructBlock progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
    return task;
}
@end
























