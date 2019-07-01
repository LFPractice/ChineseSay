//
//  CSUserInfoTool.h
//  ChineseSay
//
//  Created by 王林芳 on 2019/6/30.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSUserInfoTool : NSObject
/**
 *获取登录状态
 */
+ (BOOL)isLogin;

/**
 *登录成功
 */
+ (void)loginSuccessWithObject:(id)responseObject;

/**
 *退出登录
 */
+ (void)loginOut;
/**
 *用户token
 */
+ (NSString *)userToken;
@end

NS_ASSUME_NONNULL_END
