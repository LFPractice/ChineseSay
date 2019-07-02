//
//  LFHttpTool.h
//  Network_Tool
//
//  Created by 王林芳 on 2018/3/28.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
/*
 请求类型的枚举
 */
typedef NS_ENUM(NSUInteger,LFRequsetMethodType) {
    LFRequsetMethodTypeGET = 0,
    LFRequsetMethodTypePOST = 1,
};
/*
 请求成功block
 */
typedef void (^LFRequestSuccessBlock)(id responseObject);
/*
 请求失败block
 */
typedef void (^LFRequestFailureBlock)(NSError *error);
@interface LFHttpTool :AFHTTPSessionManager
+ (instancetype) sharedHttpTool;
+ (NSURLSessionDataTask *)getData:(NSString *)urlString
                   parameters:(id)parameters
                      success:(LFRequestSuccessBlock)success
                      faliure:(LFRequestFailureBlock)failure;
+ (NSURLSessionDataTask *)postData:(NSString *)urlString
                    parameters:(id)parameters
                       success:(LFRequestSuccessBlock)success
                       failure:(LFRequestFailureBlock)failure;
+ (NSURLSessionDataTask *)postDataWithUrl:(NSString *)url
                         constructingBody:(void (^)(id<AFMultipartFormData>))constructBlock param:(NSDictionary *)param
                                 progress:(void (^)(NSProgress *))progress
                                  success:(LFRequestSuccessBlock)success
                                  failure:(LFRequestFailureBlock)failure;
@end
