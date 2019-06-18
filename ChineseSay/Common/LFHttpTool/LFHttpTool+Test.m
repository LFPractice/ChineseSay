//
//  LFHttpTool+Test.m
//  Network_Tool
//
//  Created by 王林芳 on 2018/4/13.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import "LFHttpTool+Test.h"

@implementation LFHttpTool (Test)
+ (void)getTenderListWithPage:(NSInteger)page success:(LFRequestSuccessBlock)success failure:(LFRequestFailureBlock)failure{
    [LFHttpTool getData: @"http://172.16.19.205:8090/pinturetail-api/community/queryTenderBbsList" parameters:@{
                                         @"pageNum":@(page)
                                         } success:^(id responseObject) {
                                             success(responseObject);
                                         } faliure:^(NSError *error) {
                                             failure(error);
                                         }];
}
@end
