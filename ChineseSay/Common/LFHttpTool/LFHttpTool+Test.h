//
//  LFHttpTool+Test.h
//  Network_Tool
//
//  Created by 王林芳 on 2018/4/13.
//  Copyright © 2018年 王林芳. All rights reserved.
//

#import "LFHttpTool.h"

@interface LFHttpTool (Test)
+ (void)getTenderListWithPage:(NSInteger)page
                      success:(LFRequestSuccessBlock)success
                      failure:(LFRequestFailureBlock)failure;
@end
